//
//  GuidebookRequest.h
//  GuidebookChallenge
//
//  Created by William Hass on 2/14/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Guide.h"
#import "Venue.h"

@protocol GuidebookRequestProtocol <NSObject>

@required
- (void)requestDidFinish:(NSArray *)objects;

@optional
- (void)requestDidFailWithError:(NSError *)error;

@end

@interface GuidebookRequest : NSObject

@property (weak, nonatomic) id<GuidebookRequestProtocol> delegate;

- (void)requestData;

@end
