//
//  Venue.m
//  GuidebookChallenge
//
//  Created by William Hass on 2/14/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import "Venue.h"

@implementation Venue

static const NSString *kCity = @"city";
static const NSString *kState = @"state";

- (id)initWithJSONObject:(NSDictionary *)jsonObject {
    
    self = [super initWithJSONObject:jsonObject];
    if(self) {
        
        self.city = [jsonObject objectForKey:kCity];
        self.state = [jsonObject objectForKey:kState];
        
    }
    return self;
}

@end
