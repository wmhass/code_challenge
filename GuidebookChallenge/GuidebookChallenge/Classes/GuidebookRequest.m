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
static const NSString *kData = @"data";

- (void)requestData
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:ServiceURL]
                                             cachePolicy:NSURLRequestReloadIgnoringCacheData
                                         timeoutInterval:5000];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"RAW Response: %@",[[NSString alloc] initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
        NSArray *objects = [self parseResponse:responseObject];
        [self.delegate requestDidFinish:objects];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        }];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if([self.delegate respondsToSelector:@selector(requestDidFailWithError:)]) {
            [self.delegate performSelector:@selector(requestDidFailWithError:) withObject:error];
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        }];
        
    }];
    [operation start];
}

- (NSArray *)parseResponse:(NSDictionary *)jsonObject {
    
    NSArray *data = jsonObject[kData];
    NSMutableArray *returnData = [[NSMutableArray alloc] initWithCapacity:data.count];
    for (NSDictionary *obj in data) {
        
        Guide *g = [[Guide alloc] initWithJSONObject:obj];
        [returnData addObject:g];
    }
    return [NSArray arrayWithArray:returnData];
}

@end
