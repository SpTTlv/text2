//
//  LoginViewController.m
//  TT2016
//
//  Created by BeanSlink on 16/4/13.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "LoginViewController.h"
#import "CYLTabBarControllerConfig.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *LineImageConstraintWidth;
@property (strong, nonatomic) IBOutlet UILabel *BottomTextLabel;
@property (strong, nonatomic) IBOutlet UIView *BottomView;

@end

@implementation LoginViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}
- (void)viewDidLoad {
    [super viewDidLoad];


    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationItem.title = @"登录页面";

    
    
    
    [self MyAnimation];



}
- (void)MyAnimation
{
    _TopWelcomeLabel.transform = CGAffineTransformMakeTranslation(0, -200);
    _TopOrderLabel.transform = CGAffineTransformMakeTranslation(0, -200);
    _LeftImage.transform = CGAffineTransformMakeTranslation(-200, 0);
    _LineImageConstraintWidth.constant = 0;
    
    [self.CodeTextField.rac_textSignal subscribeNext:^(id x) {
        if (self.CodeTextField.text.length >= 11) {
            self.loginButton.userInteractionEnabled = YES;
        }else
        {
            self.loginButton.userInteractionEnabled = NO;
        }
        CGFloat progress = self.CodeTextField.text.length/11.0;
        [MyAnimation registerButtonWithAnimation:self.loginButton withView:self.view andProgress:progress];
    }];

    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [MyAnimation initTitleTransfrom:self.TopWelcomeLabel withView:self.view];
    [MyAnimation initTitleTransfrom:self.TopOrderLabel withView:self.view];
    [MyAnimation initTitleX:self.LeftImage WithView:self.view];
    [MyAnimation textFieldAnimationWithContraint:self.LineImageConstraintWidth WithView:self.view];

    [MyAnimation tipsLabelMaskAnimation:_BottomTextLabel withBeginTime:0];
    [MyAnimation tipsLabelMaskAnimation:_BottomTextLabel withBeginTime:1];
}
- (IBAction)LoginButton:(UIButton *)sender
{
    if ([self.CodeTextField.text isEqualToString:@"woshinibaba"]) {
        CYLTabBarControllerConfig * tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
        [self presentViewController:tabBarControllerConfig.tabBarController animated:YES completion:^{
            
        }];
    }
   
}
//服务协议
- (IBAction)ServeXieY:(UIButton *)sender
{
    
//    [self presentViewController:[NSClassFromString(@"LoginServeXYViewController") new] animated:YES completion:^{
//        
//    }];
    [self.navigationController pushViewController:[NSClassFromString(@"LoginServeXYViewController") new] animated:YES];
    
    
}
//用户条款
- (IBAction)UserTiaok:(UIButton *)sender
{
//    [self presentViewController:[NSClassFromString(@"LoginServeXYViewController") new] animated:YES completion:^{
//        
//    }];
    [self.navigationController pushViewController:[NSClassFromString(@"LoginServeXYViewController") new] animated:YES];
}




@end
