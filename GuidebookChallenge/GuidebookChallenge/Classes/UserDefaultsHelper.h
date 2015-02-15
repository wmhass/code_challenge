//
//  UserDefaultsHelper.h
//  GuidebookChallenge
//
//  Created by William Hass on 2/15/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultsHelper : NSObject

extern NSString *kOfflineMode;

+ (id)readKey:(NSString *)key;
+ (BOOL)saveValue:(id)value forKey:(NSString *)key;


@end
