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
    [self.window makeKeyAndVisible];
    
    // 获取info文件
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    // 获取App的版本号
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    
    // 判断是否第一次启动, 并且App版本是否一致
    UIViewController *vc = nil;
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kIsFirstLunch] || [[[NSUserDefaults standardUserDefaults] valueForKey:kVersion] isEqualToString: appVersion]) {
        vc = [[MainViewController alloc] init];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kIsFirstLunch];
        [[NSUserDefaults standardUserDefaults] setObject:appVersion forKey:kVersion];
        FirstLunchViewController *firstVC = [[FirstLunchViewController alloc] init];
        
        // 设置导航视图
        NSMutableArray *arr = [NSMutableArray array];
        for (NSInteger i = 0; i < 3; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"deemo_icon"]];
            [arr addObject:imageView];
        }
        firstVC.scrollViewArr = arr;
        
        // 设置进入按钮
        UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [infoButton setTitle:@"欢迎" forState:UIControlStateNormal];
        [infoButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        infoButton.frame = CGRectMake(0, 0, 100, 40);
        firstVC.intoButton = infoButton;
        
        // 设置主界面
        firstVC.presentViewController = [[MainViewController alloc] init];
        vc = firstVC;
    }
    
    // 设置 window 根视图控制器
    self.window.rootViewController = vc;
    
    return YES;
}

@end