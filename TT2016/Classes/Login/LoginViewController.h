//
//  LoginViewController.h
//  TT2016
//
//  Created by BeanSlink on 16/4/13.
//  Copyright © 2016年 TT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *TopWelcomeLabel;
@property (strong, nonatomic) IBOutlet UILabel *TopOrderLabel;
@property (strong, nonatomic) IBOutlet UIImageView *LeftImage;
@property (strong, nonatomic) IBOutlet UITextField *CodeTextField;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;

@end
