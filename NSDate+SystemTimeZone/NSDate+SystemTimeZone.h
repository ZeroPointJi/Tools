//
//  NSDate+SystemTimeZone.h
//  Pedomet
//
//  Created by zero on 16/4/19.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SystemTimeZone)

/**
 *  转换时间为本地时区
 *
 *  @param date 传入的时间
 *
 *  @return 转换后的时间
 */
+ (NSDate *)systemTimeZoneWithDate:(NSDate *)date;

/**
 *  根据格式转换时间
 *
 *  @param date       传入的时间
 *  @param dateFormat 时间格式
 *
 *  @return 转换后的时间字符串
 */
+ (NSString *)changeDate:(NSDate *)date WithFormat:(NSString *)dateFormat;

@end
