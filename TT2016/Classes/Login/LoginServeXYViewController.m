//
//  LoginServeXYViewController.m
//  TT2016
//
//  Created by BeanSlink on 16/4/15.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "LoginServeXYViewController.h"

@interface LoginServeXYViewController ()

@property (nonatomic,strong)UIWebView * webView;


@end

@implementation LoginServeXYViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initSrc];
}
- (void)initSrc
{
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGH-64)];
    [self.view addSubview:_webView];
    _webView.backgroundColor = [UIColor whiteColor];
    NSString * resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString * filePath = [resourcePath stringByAppendingPathComponent:@"Statement.html"];
    NSString * htmlString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    

}



@end
