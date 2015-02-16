//
//  Guide.m
//  GuidebookChallenge
//
//  Created by William Hass on 2/14/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import "Guide.h"
#import "Venue.h"

@implementation Guide

static const NSString *kEndDate = @"endDate";
static const NSString *kIcon = @"icon";
static const NSString *kName = @"name";
static const NSString *kObjType = @"objType";
static const NSString *kStartDate = @"startDate";
static const NSString *kUrl = @"url";
static const NSString *kVenue = @"venue";
static NSString *dateFormat = @"MMM, dd, yyyy";

- (id)initWithJSONObject:(NSDictionary *)jsonObject {
    
    self = [super initWithJSONObject:jsonObject];
    if(self) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:dateFormat];
        [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en"]];
        
        self.endDate = [formatter dateFromString:jsonObject[kEndDate]];
        self.startDate = [formatter dateFromString:jsonObject[kStartDate]];
        
        
        
        self.icon = [NSURL URLWithString:jsonObject[kIcon]];
        self.name = jsonObject[kName];
        self.objType = jsonObject[kObjType];
        self.url = jsonObject[kUrl];
        self.venue = [[Venue alloc] initWithJSONObject:jsonObject[kVenue]];
    }
    return self;
}

@end
