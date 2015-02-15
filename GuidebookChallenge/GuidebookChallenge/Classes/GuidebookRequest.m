//
//  GuidebookRequest.m
//  GuidebookChallenge
//
//  Created by William Hass on 2/14/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import "GuidebookRequest.h"
#import "AFNetworking.h"
@implementation GuidebookRequest

static NSString *ServiceURL = @"https://www.guidebook.com/service/v2/upcomingGuides/";

- (void)requestData
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:ServiceURL]
                                             cachePolicy:NSURLRequestReloadIgnoringCacheData
                                         timeoutInterval:5000];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Objects: %@", responseObject);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if([self.delegate respondsToSelector:@selector(requestDidFailWithError:)]) {
            [self.delegate performSelector:@selector(requestDidFailWithError:) withObject:error];
        }
    }];
    [operation start];
}

@end
