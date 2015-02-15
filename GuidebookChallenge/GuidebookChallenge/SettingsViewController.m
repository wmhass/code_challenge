//
//  SettingsViewController.m
//  GuidebookChallenge
//
//  Created by William Hass on 2/15/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import "SettingsViewController.h"
#import "UserDefaultsHelper.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    id value = [UserDefaultsHelper readKey:kOfflineMode];
    self.switchOffline.on = (value !=nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)switchChanged:(id)sender {
    if([self.delegate respondsToSelector:@selector(offlineModeChanged)]) {
        [self.delegate performSelector:@selector(offlineModeChanged)];
    }
    
    id value = self.switchOffline.on ? @(1) : nil;
    [UserDefaultsHelper saveValue:value forKey:kOfflineMode];
    
}

@end
