//
//  ViewController.m
//  GuidebookChallenge
//
//  Created by William Hass on 2/14/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import "TableDataViewController.h"
#import "GuideTableViewCell.h"

@interface TableDataViewController () {
    GuidebookRequest *gbRequest;
}
@end

@implementation TableDataViewController

static NSString *dateFormat = @"M/d/yyyyy";
static NSString *SettingsSegueIdentifier = @"settings_segue";

- (void)viewDidLoad {
    gbRequest = [[GuidebookRequest alloc] init];
    gbRequest.delegate = self;
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:dateFormat];
    
    [super viewDidLoad];
    
    [self loadData];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
}

- (void)loadData {
    [self.navigationItem.leftBarButtonItem setEnabled:NO];
    [gbRequest requestData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (GuideTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    GuideTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // name, city, state, start date, and end date.
    
    Guide *g = self.tableData[indexPath.row];
    cell.lblName.text = g.name;
    
    if(g.venue.city && g.venue.state) {
        cell.lblCityState.text = [NSString stringWithFormat:@"%@ - %@",g.venue.city,g.venue.state];
    } else if (g.venue.city && !g.venue.state) {
        cell.lblCityState.text = [NSString stringWithFormat:@"%@",g.venue.city];
    } else if (!g.venue.city && g.venue.state) {
        cell.lblCityState.text = [NSString stringWithFormat:@"%@",g.venue.state];
    }
    
    cell.lblStartEndDate.text = [NSString stringWithFormat:@"%@ - %@",
                                 [self.dateFormatter stringFromDate:g.startDate],
                                 [self.dateFormatter stringFromDate:g.endDate]];
    
    if(g.imgIcon) {
        cell.imageView.image = g.imgIcon;
        [cell.loader stopAnimating];
    } else {
        cell.imageView.image = nil;
        [cell.loader startAnimating];
    }
    
    return cell;
}



#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - GuidebookRequestDelegate

- (void)requestDidFinish:(NSArray *)objects {
    
    [self.navigationItem.leftBarButtonItem setEnabled:YES];
    self.tableData = [objects sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDate *dt1 = [(Guide *)obj1 startDate];
        NSDate *dt2 = [(Guide *)obj2 startDate];
        
        if(dt1.timeIntervalSince1970 > dt2.timeIntervalSince1970)
            return NSOrderedDescending;
        else if(dt2.timeIntervalSince1970 > dt1.timeIntervalSince1970)
            return NSOrderedAscending;
        else
            return NSOrderedSame;
    }];
    
    [self.tableView reloadData];
    
}

- (void)requestDidFailWithError:(NSError *)error {
    
    [self.navigationItem.leftBarButtonItem setEnabled:YES];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops!"
                                                                   message:NSLocalizedString(@"request_error_msg", nil)
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"ok_button_title", nil)
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action) {
                                                         
                                                     }];
    [alert addAction:okAction];
    
    [self presentViewController:alert
                       animated:YES
                     completion:^{
                         
                     }];
}

#pragma mark - IB Actions

- (IBAction)btnReloadToueched:(id)sender {
    self.tableData = nil;
    [self.tableView reloadData];
    [self loadData];
}

#pragma mark - SettingsViewControllerDelegate
- (void)offlineModeChanged {
    NSLog(@"Changed");
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:SettingsSegueIdentifier]) {
        [(SettingsViewController *)segue.destinationViewController setDelegate:self];
    }
}

@end