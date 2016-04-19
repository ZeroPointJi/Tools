//
//  ViewController.m
//  Pedomet
//
//  Created by zero on 16/4/19.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "ViewController.h"
#import "JLKPedometer.h"
@import CoreMotion;

//static CMPedometer *pedometer = nil;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JLKPedometer *pedometer = [[JLKPedometer alloc] init];
    
    [pedometer stepFromTodayWithHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
        NSLog(@"%@", error);
        NSLog(@"%@", pedometerData.numberOfSteps);
    }];
    
    /*
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pedometer = [[CMPedometer alloc] init];
    });
    
    if ([CMPedometer isStepCountingAvailable]) {
        // 开始时间
        NSDate *startTime = [self getStartTime];
        // 结束时间
        NSDate *endTime = [self getEndTime];
        
        // 计算一个时间方位内的数据, 最大7天, 参数: 开始时间, 结束时间, block
        [pedometer queryPedometerDataFromDate:startTime toDate:endTime withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
            if (error) {
                NSLog(@"%@", error);
            } else {
                NSLog(@"开始时间: %@", startTime);
                NSLog(@"结束时间: %@", endTime);
                NSLog(@"步数: %@", pedometerData.numberOfSteps);
                NSLog(@"距离: %@", pedometerData.distance);
            }
        }];
        
        // 计算指定开始时间到当前时间的数据, 参数: 开始世界, block
        [pedometer startPedometerUpdatesFromDate:startTime withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
            if (error) {
                NSLog(@"%@", error);
            } else {
                NSLog(@"开始时间: %@", startTime);
                NSLog(@"结束时间: %@", endTime);
                NSLog(@"步数: %@", pedometerData.numberOfSteps);
                NSLog(@"距离: %@", pedometerData.distance);
            }
        }];
    }
     */
}

/** 获取开始时间  即当前0时0分0秒*/
- (NSDate *)getStartTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *stringDate = [formatter stringFromDate:[NSDate date]];
    NSDate *date = [formatter dateFromString:stringDate];
    
    return date;
}

/** 获取当前时区的时间 */
- (NSDate *)getEndTime
{
    // 转换成本地时区
    NSDate *date = [NSDate date];
    
    return date;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
