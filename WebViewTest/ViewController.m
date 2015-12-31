//
//  ViewController.m
//  WebViewTest
//
//  Created by Bryant Hang on 15/12/30.
//  Copyright © 2015年 Bryant Hang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,40)];
    searchBar.placeholder = @"test";   //设置占位符
//    searchBar.delegate = self;
    
    webView = [[UIWebView alloc] initWithFrame: CGRectMake(0, searchBar.frame.size.height, self.view.frame.size.width,1)];
    [webView setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight];
    webView.layer.cornerRadius = 8;
    webView.layer.masksToBounds = YES;
    // 给图层添加一个有色边框
    webView.scalesPageToFit = YES;
    webView.layer.borderWidth = 5;
    webView.layer.borderColor = [[UIColor colorWithRed:0.52 green:0.09 blue:0.07 alpha:1] CGColor];
    
    [webView setBackgroundColor:[UIColor blackColor]];
    [webView setOpaque:NO];
    [webView.scrollView setScrollEnabled:NO];
    webView.delegate = self;
    [webView sizeToFit];
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.toutiao.com/a6233620781802537218/?utm_campaign=open&utm_medium=webview&utm_source=zhwnl"]];
    
    scrollView = [ [UIScrollView alloc ] initWithFrame:[[ UIScreen mainScreen ] bounds ]];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1);
    [self.view addSubview: scrollView];
    [scrollView addSubview: searchBar];
    [scrollView addSubview: webView];
    [webView loadRequest:request];
    
    
}

- (void) webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
}
- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
    CGRect frame = webView.frame;
    frame.size.height = webView.scrollView.contentSize.height + 50;
    webView.frame = frame;
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, frame.size.height + searchBar.frame.size.height);
}
- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"didFailLoadWithError:%@", error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
