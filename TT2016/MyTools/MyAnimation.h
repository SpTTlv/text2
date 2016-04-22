//
//  MyAnimation.h
//  TT2016
//
//  Created by BeanSlink on 16/4/14.
//  Copyright © 2016年 TT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyAnimation : NSObject
/**
 *  修改Y轴
 *
 *  @param label <#label description#>
 *  @param view  <#view description#>
 */
+(void)initTitleTransfrom:(UILabel *)label withView:(UIView *)view;
/**
 *  line 扩展
 *
 *  @param contraint contraint description
 *  @param view      view description
 */
+(void)textFieldAnimationWithContraint:(NSLayoutConstraint *)contraint WithView:(UIView *)view;

+(void)initTitleX:(UIImageView *)imageView WithView:(UIView *)view;

/**
 *  文字遮挡
 *
 *  @param view      <#view description#>
 *  @param beginTime <#beginTime description#>
 */
+ (void)tipsLabelMaskAnimation:(UIView *)view withBeginTime:(NSTimeInterval)beginTime;

/**
 *  button 渐出
 *
 *  @param button   <#button description#>
 *  @param view     <#view description#>
 *  @param progress <#progress description#>
 */
+(void)registerButtonWithAnimation:(UIButton *)button withView:(UIView *)view andProgress:(CGFloat)progress;
@end
