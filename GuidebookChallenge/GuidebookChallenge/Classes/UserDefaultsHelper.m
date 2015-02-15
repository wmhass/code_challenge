//
//  UserDefaultsHelper.m
//  GuidebookChallenge
//
//  Created by William Hass on 2/15/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import "UserDefaultsHelper.h"

@implementation UserDefaultsHelper

NSString *kOfflineMode = @"kOfflineMode";

+ (id)readKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

+ (BOOL)saveValue:(id)value forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    return [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
