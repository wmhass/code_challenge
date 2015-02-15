//
//  SettingsViewController.h
//  GuidebookChallenge
//
//  Created by William Hass on 2/15/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingsViewControllerDelegate <NSObject>

@optional
- (void)offlineModeChanged;

@end

@interface SettingsViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UISwitch *switchOffline;
@property (weak, nonatomic) id<SettingsViewControllerDelegate> delegate;

- (IBAction)switchChanged:(id)sender;

@end
