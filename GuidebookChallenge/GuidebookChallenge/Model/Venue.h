//
//  Venue.h
//  GuidebookChallenge
//
//  Created by William Hass on 2/14/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import "ObjectFromJSON.h"

@interface Venue : ObjectFromJSON

@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *state;

@end