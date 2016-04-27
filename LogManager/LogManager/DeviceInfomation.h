//
//  DeviceInfomation.h
//  DeviceInfomation
//
//  Created by zero on 16/4/27.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceInfomation : NSObject

/**
 *  获取手机型号
 *
 *  @return 手机型号
 */
+ (NSString*)deviceModel;

/**
 *  获取系统版本
 *
 *  @return 系统版本
 */
+ (NSString *)deviceVersion;

@end
