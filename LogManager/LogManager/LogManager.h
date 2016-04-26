//
//  LogManager.h
//  LogManager
//
//  Created by zero on 16/4/26.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG
#define LOG(fmt, ...) do {                                            \
    NSString* file = [[NSString alloc] initWithFormat:@"%s", __FILE__]; \
    NSLog((@"File:%@ Function:%s Line:%d content:" fmt), [file lastPathComponent], __func__, __LINE__, ##__VA_ARGS__); \
} while(0)
#define LOG_METHOD NSLog(@"%s", __func__)
#define LOG_CMETHOD NSLog(@"%@/%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd))
#define LOG_TRACE(x) do {printf x; putchar('\n'); fflush(stdout);} while (0)
#define LOG_APPEND NSLog(@"------------------------------------------------------------------------------------------------应用程序关闭------------------------------------------------------------------------------------------------")
#else
#define LOG(...)
#define LOG_METHOD
#define LOG_CMETHOD
#define LOG_TRACE(x)
#define LOG_APPEND
#endif

@interface LogManager : NSObject

/**
 *  NSLog 输出信息保存到本地
 */
+ (void)redirectNSLogToDocumentFolder;

@end
