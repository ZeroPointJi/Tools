//
//  AppDelegate.m
//  LogManager
//
//  Created by zero on 16/4/26.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 输出文件所在地址
    NSLog(@"%@", NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES));
    
    [LogManager redirectNSLogToDocumentFolder];
    
    LOG(@"应用程序完成加载");
    LOG(@"你给不给我出来?");
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    LOG(@"");
    LOG_APPEND;
}



@end
