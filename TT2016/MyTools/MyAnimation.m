//
//  MyAnimation.m
//  TT2016
//
//  Created by BeanSlink on 16/4/14.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "MyAnimation.h"
static CGFloat const kBottomLineWidth = 300;

@implementation MyAnimation
+(void)initTitleTransfrom:(UILabel *)label withView:(UIView *)view
{
    
    
    [UIView animateWithDuration:1.5 animations:^{
        label.transform = CGAffineTransformIdentity;
    }];
    
}
+(void)initTitleX:(UIImageView *)imageView WithView:(UIView *)view
{
    
    [UIView animateWithDuration:1.5 animations:^{
        imageView.transform = CGAffineTransformIdentity;
    }];
    
}
+(void)textFieldAnimationWithContraint:(NSLayoutConstraint *)contraint WithView:(UIView *)view
{
    contraint.constant = kBottomLineWidth;
    
    [UIView animateWithDuration:1.5 animations:^{
        
        [view layoutIfNeeded];
        
        
    }];
    
    
}
+ (void)tipsLabelMaskAnimation:(UIView *)view withBeginTime:(NSTimeInterval)beginTime
{
    CGPathRef beginPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 0, CGRectGetHeight(view.bounds))].CGPath;
    
    CGPathRef endPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds))].CGPath;
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.path = beginPath;
    
    view.layer.mask = layer;
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 1;
    animation.beginTime = CACurrentMediaTime() + beginTime;
    animation.fromValue = (id)layer.path;
    animation.toValue = (__bridge id)endPath;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [layer addAnimation:animation forKey:@"shapeLayerPath"];
    
}

+(void)registerButtonWithAnimation:(UIButton *)button withView:(UIView *)view andProgress:(CGFloat)progress
{
    
    static CAShapeLayer * layer = nil;
    if (!button.layer.mask ) {
        layer = [CAShapeLayer layer];
        layer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(button.bounds)* progress, CGRectGetHeight(button.bounds))].CGPath;
        layer.fillColor = [UIColor whiteColor].CGColor;
        button.layer.mask = layer;
        
    }else{
        CGPathRef path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(button.bounds)* progress, CGRectGetHeight(button.bounds))].CGPath;
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"path"];
        animation.duration = 0.25;
        animation.fromValue = (id)layer.path;
        animation.toValue = (__bridge id)path;
        animation.removedOnCompletion = YES;
        [layer addAnimation:animation forKey:@"shapeLayerPath"];
        layer.path = path;
        
    }
    
    
}
@end
