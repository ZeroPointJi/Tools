//
//  AppDelegate.m
//  LunchView
//
//  Created by zero on 16/4/27.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstLunchViewController.h"
#import "MainViewController.h"

#define kVersion  @"version"
#define kIsFirstLunch  @"firstLunch"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 设置window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 获取info文件
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    // 获取App的版本号
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    
    // 判断是否第一次启动, 并且App版本一致
    UIViewController *vc = nil;
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kIsFirstLunch] || [[[NSUserDefaults standardUserDefaults] valueForKey:kVersion] isEqualToString: appVersion]) {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kIsFirstLunch];
        vc = [[MainViewController alloc] init];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kIsFirstLunch];
        [[NSUserDefaults standardUserDefaults] setObject:appVersion forKey:kVersion];
        vc = [[FirstLunchViewController alloc] init];
    }
    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end