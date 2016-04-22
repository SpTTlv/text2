//
//  FirstViewController.m
//  TT2016
//
//  Created by BeanSlink on 16/4/13.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self LaunchImage];

}
- (void)LaunchImage
{
    
    UIImage *icon = [UIImage imageNamed:@"startImage"];
    
    UIColor *color = MAINCOLOER;
    
    CBZSplashView *splashView = [CBZSplashView splashViewWithIcon:icon backgroundColor:color];
    
    splashView.animationDuration = 1.4f;
    
    splashView.iconColor = [UIColor whiteColor];
    
    [[UIApplication sharedApplication].keyWindow addSubview:splashView];
//    [self.view addSubview:splashView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [splashView startAnimation];//延迟0.5秒开启动画
        
    });
    
    
}



@end
