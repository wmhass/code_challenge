//
//  DetailViewController.m
//  GuidebookChallenge
//
//  Created by Android on 2/25/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import "DetailViewController.h"
#import "SVProgressHUD.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}

- (NSURL *)buildUrl {
    
    NSString *strUrl = [NSString stringWithFormat:@"https://guidebook.com/%@",[self.URLToOpen stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]]];
    return [NSURL URLWithString:strUrl];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!self.URLToOpen) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    
    // Do any additional setup after loading the view.
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[self buildUrl]
                                             cachePolicy:NSURLRequestReloadIgnoringCacheData
                                         timeoutInterval:500];
    [self.webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [SVProgressHUD show];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [SVProgressHUD dismiss];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [SVProgressHUD dismiss];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
