//
//  LogManager.m
//  LogManager
//
//  Created by zero on 16/4/26.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "LogManager.h"

@implementation LogManager

+ (void)redirectNSLogToDocumentFolder{
    // 获取Document文件所在地址
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    // 转换时间格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *stringDate = [formatter stringFromDate:[NSDate date]];
    
    // 拼接文件名
    NSString *fileName =[NSString stringWithFormat:@"%@.log", stringDate];
    NSString *logFilePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    
    // 写入日志文件
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding],"a+",stderr);
}

@end
