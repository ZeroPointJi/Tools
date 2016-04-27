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
    [LogManager redirectNSLogToDocumentFolder];
    
    LOG(@"应用程序完成加载");
    LOG(@"你给不给我出来?");
    LOG(@"应该没有错吧");
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    LOG(@"");
    LOG_APPEND;
}

@end
