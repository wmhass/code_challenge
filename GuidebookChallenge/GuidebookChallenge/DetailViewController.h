//
//  DetailViewController.h
//  GuidebookChallenge
//
//  Created by Android on 2/25/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) NSString *URLToOpen;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
