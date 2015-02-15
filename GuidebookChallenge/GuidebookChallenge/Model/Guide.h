//
//  Guide.h
//  GuidebookChallenge
//
//  Created by William Hass on 2/14/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import "ObjectFromJSON.h"
#import <UIKit/UIKit.h>
@class Venue;
@interface Guide : ObjectFromJSON

@property (strong, nonatomic) NSDate *endDate;
@property (strong, nonatomic) NSURL *icon;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *objType;
@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSString *strURL;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) Venue *venue;
@property (strong, atomic) UIImage *imgIcon;

@end