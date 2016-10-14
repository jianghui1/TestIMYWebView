//
//  ViewController.m
//  TestIMYWebView
//
//  Created by ys on 16/3/5.
//  Copyright © 2016年 jzh. All rights reserved.
//

#import "ViewController.h"

#import <WebKit/WebKit.h>
#import <IMYWebView/IMYWebView.h>

@interface ViewController ()<IMYWebViewDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIWebView *mWebView;
@property (nonatomic, strong) IMYWebView *mmWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) / 3)];
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://item.taobao.com/item.htm?spm=a1z10.1-c.w4023-15151293842.10.kkwUzD&id=538959049110"]]];
    self.webView.allowsBackForwardNavigationGestures = YES;
    
    self.mWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) / 3, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) / 3)];
    [self.view addSubview:self.mWebView];
    [self.mWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://item.taobao.com/item.htm?spm=a1z10.1-c.w4023-15151293842.10.kkwUzD&id=538959049110"]]];
    
    self.mmWebView = [[IMYWebView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) / 3 * 2, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) / 3)];
    [self.view addSubview:self.mmWebView];
    [self.mmWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://guang.taobao.com/detail/index.htm?spm=0.0.0.0.4WDPwa&uid=1756446260&sid=7964954804&itemid=537615006462"]]];
    self.mmWebView.delegate = self;

}

- (BOOL)webView:(IMYWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%@", request.URL.absoluteString);
    return YES;
}

@end
