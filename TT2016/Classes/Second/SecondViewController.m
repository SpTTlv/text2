//
//  SecondViewController.m
//  TT2016
//
//  Created by BeanSlink on 16/4/13.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, weak) CALayer *secondLayer;

@property (nonatomic, weak) CALayer *minuteLayer;

@property (nonatomic, weak) CALayer *hourLayer;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    [self initWatch];

}
- (void)initWatch
{
    //1.添加表盘
    [self addWatch];
    //2.添加秒针
    [self addSecond];
    //4.添加分针
    [self addMinute];
    //6.添加时针
    [self addHour];
    //3.旋转秒针
    [self startRun];

}
- (void)addWatch
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.bounds = CGRectMake(0, 0, 400, 400);
    imageView.image = [UIImage imageNamed:@"clockBg"];
    [self.view addSubview:imageView];
    imageView.center = self.view.center;
}
- (void)addSecond
{
    CALayer * layer = [[CALayer alloc] init];
    layer.bounds = CGRectMake(0, 0, 6, 200);
    layer.position= self.view.center;
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:layer];
    self.secondLayer = layer;
}
- (void)addMinute
{
    CALayer * layer = [[CALayer alloc] init];
    layer.bounds = CGRectMake(0, 0, 10, 180);
    layer.position = self.view.center;
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:layer];
    self.minuteLayer = layer;
}
- (void)addHour
{
    CALayer * layer = [[CALayer alloc] init];
    layer.bounds = CGRectMake(0, 0, 15, 160);
    layer.position = self.view.center;
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:layer];
    self.hourLayer = layer;
    
}
- (void)startRun
{
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(rotationLine) userInfo:nil repeats:YES];
}
#define angle2Arc(angle) (angle * M_PI / 180)

#define secondAngle 6

#define minuteAngle 6

#define hourAngle 30

#define hourMinuteAngle 0.5
- (void)rotationLine
{
     //旋转秒针
    NSCalendar * calendar = [NSCalendar  currentCalendar];
    NSDateComponents * cmp  = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    NSInteger currentSecond = cmp.second;
    NSInteger angle_second = currentSecond * secondAngle;
    
    CGFloat secondArc = angle2Arc(angle_second);
    self.secondLayer.transform = CATransform3DMakeRotation(secondArc, 0, 0, 1);
    
    //旋转分针
    NSInteger currentMinute = cmp.minute;
    
    NSInteger angle_minute = currentMinute * minuteAngle;
    
    NSInteger angle_minte_second = currentSecond * 0.1;
    
    angle_minute += angle_minte_second;
    
    
    CGFloat minuteArc = angle2Arc(angle_minute);
    
    self.minuteLayer.transform = CATransform3DMakeRotation(minuteArc, 0, 0, 1);
    
    //旋转时针
    NSInteger currentHour = cmp.hour;
    NSInteger angle_hour = currentHour * hourAngle;
    
    NSInteger angle_hour_minute  = currentMinute * hourMinuteAngle;
    angle_hour += angle_hour_minute;
    
    
    CGFloat hourArc = angle2Arc(angle_hour);
    
    self.hourLayer.transform = CATransform3DMakeRotation(hourArc, 0, 0, 1);
    
    
    
}


@end
