//
//  ViewController.h
//  GuidebookChallenge
//
//  Created by William Hass on 2/14/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuidebookRequest.h"

@interface TableDataViewController : UITableViewController <GuidebookRequestProtocol>

@property (strong, nonatomic) NSArray *tableData;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;

- (IBAction)btnReloadToueched:(id)sender;

@end

