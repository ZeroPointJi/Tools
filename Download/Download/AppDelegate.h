//
//  AppDelegate.h
//  Download
//
//  Created by zero on 16/4/12.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// 将系统后台完成方法中的 block 参数传到具体的下载对象中执行
@property (nonatomic, copy) void (^backgroundHandle) ();

@end

