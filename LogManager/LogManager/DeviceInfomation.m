//
//  DeviceInfomation.m
//  DeviceInfomation
//
//  Created by zero on 16/4/27.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "DeviceInfomation.h"
#import <sys/utsname.h>
#import <UIKit/UIKit.h>

@implementation DeviceInfomation

+ (NSString*)deviceModel
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone 系列
    if ([deviceModel isEqualToString:@"iPhone1,1"])    return @"iPhone_1G";
    if ([deviceModel isEqualToString:@"iPhone1,2"])    return @"iPhone_3G";
    if ([deviceModel isEqualToString:@"iPhone2,1"])    return @"iPhone_3GS";
    if ([deviceModel isEqualToString:@"iPhone3,1"])    return @"iPhone_4";
    if ([deviceModel isEqualToString:@"iPhone3,2"])    return @"Verizon_iPhone4";
    if ([deviceModel isEqualToString:@"iPhone4,1"])    return @"iPhone_4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"])    return @"iPhone_5";
    if ([deviceModel isEqualToString:@"iPhone5,2"])    return @"iPhone_5";
    if ([deviceModel isEqualToString:@"iPhone5,3"])    return @"iPhone_5C";
    if ([deviceModel isEqualToString:@"iPhone5,4"])    return @"iPhone_5C";
    if ([deviceModel isEqualToString:@"iPhone6,1"])    return @"iPhone_5S";
    if ([deviceModel isEqualToString:@"iPhone6,2"])    return @"iPhone_5S";
    if ([deviceModel isEqualToString:@"iPhone7,1"])    return @"iPhone_6Plus";
    if ([deviceModel isEqualToString:@"iPhone7,2"])    return @"iPhone_6";
    if ([deviceModel isEqualToString:@"iPhone8,1"])    return @"iPhone_6s";
    if ([deviceModel isEqualToString:@"iPhone8,2"])    return @"iPhone_6sPlus";
    
    //iPod 系列
    if ([deviceModel isEqualToString:@"iPod1,1"])      return @"iPod_Touch_1G";
    if ([deviceModel isEqualToString:@"iPod2,1"])      return @"iPod_Touch_2G";
    if ([deviceModel isEqualToString:@"iPod3,1"])      return @"iPod_Touch_3G";
    if ([deviceModel isEqualToString:@"iPod4,1"])      return @"iPod_Touch_4G";
    if ([deviceModel isEqualToString:@"iPod5,1"])      return @"iPod_Touch_5G";
    
    //iPad 系列
    if ([deviceModel isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceModel isEqualToString:@"iPad2,1"])      return @"iPad_2_(WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,2"])      return @"iPad_2_(GSM)";
    if ([deviceModel isEqualToString:@"iPad2,3"])      return @"iPad_2_(CDMA)";
    if ([deviceModel isEqualToString:@"iPad2,4"])      return @"iPad_2_(32nm)";
    if ([deviceModel isEqualToString:@"iPad2,5"])      return @"iPad_mini_(WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,6"])      return @"iPad_mini_(GSM)";
    if ([deviceModel isEqualToString:@"iPad2,7"])      return @"iPad_mini_(CDMA)";
    
    if ([deviceModel isEqualToString:@"iPad3,1"])      return @"iPad_3_(WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,2"])      return @"iPad_3_(CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,3"])      return @"iPad_3_(4G)";
    if ([deviceModel isEqualToString:@"iPad3,4"])      return @"iPad_4_(WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,5"])      return @"iPad_4_(4G)";
    if ([deviceModel isEqualToString:@"iPad3,6"])      return @"iPad_4_(CDMA)";
    
    if ([deviceModel isEqualToString:@"iPad4,1"])      return @"iPad_Air";
    if ([deviceModel isEqualToString:@"iPad4,2"])      return @"iPad_Air";
    if ([deviceModel isEqualToString:@"iPad4,3"])      return @"iPad_Air";
    if ([deviceModel isEqualToString:@"iPad5,3"])      return @"iPad_Air2";
    if ([deviceModel isEqualToString:@"iPad5,4"])      return @"iPad_Air2";
    if ([deviceModel isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceModel isEqualToString:@"x86_64"])       return @"Simulator";
    
    if ([deviceModel isEqualToString:@"iPad4,4"]
        ||[deviceModel isEqualToString:@"iPad4,5"]
        ||[deviceModel isEqualToString:@"iPad4,6"])      return @"iPad_mini_2";
    
    if ([deviceModel isEqualToString:@"iPad4,7"]
        ||[deviceModel isEqualToString:@"iPad4,8"]
        ||[deviceModel isEqualToString:@"iPad4,9"])      return @"iPad_mini_3";
    
    return deviceModel;
}

+ (NSString *)deviceVersion
{
    NSString *deviceVersion = [[UIDevice currentDevice] systemVersion];
    
    return deviceVersion;
}
@end
