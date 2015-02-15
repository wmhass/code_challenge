//
//  ViewController.m
//  GuidebookChallenge
//
//  Created by William Hass on 2/14/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import "TableDataViewController.h"

@interface TableDataViewController () {
    GuidebookRequest *gbRequest;
}
@end

@implementation TableDataViewController

- (void)viewDidLoad {
    gbRequest = [[GuidebookRequest alloc] init];
    gbRequest.delegate = self;
    [super viewDidLoad];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier];
        
    }
    
    // name, city, state, start date, and end date.
    
    Guide *g = self.tableData[indexPath.row];
    cell.textLabel.text = g.name;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - GuidebookRequestDelegate

- (void)requestDidFinish:(NSArray *)objects {
    
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

@end