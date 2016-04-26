//
//  NSDate+SystemTimeZone.m
//  Pedomet
//
//  Created by zero on 16/4/19.
//  Copyright © 2016年 zero. All rights reserved.
//

//#import "NSDate+SystemTimeZone.h"

@implementation NSDate (SystemTimeZone)

+ (instancetype)systemTimeZoneWithDate:(NSDate *)date
{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSTimeInterval interval = [zone secondsFromGMTForDate:date];
    NSDate *systemTimeZoneDate = [date dateByAddingTimeInterval:(double)interval];
    
    return systemTimeZoneDate;
}


+ (NSString *)changeDate:(NSDate *)date WithFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormat;
    NSString *stringDate = [formatter stringFromDate:date];
    
    return stringDate;
}

@end
