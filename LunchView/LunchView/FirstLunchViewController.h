//
//  FirstLunchViewController.h
//  LunchView
//
//  Created by zero on 16/4/27.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstLunchViewController : UIViewController

/** 所有引导的视图 */
@property (nonatomic, copy) NSArray *scrollViewArr;
/** 引导界面过后推出的视图控制器 */
@property (nonatomic, strong) UIViewController *presentViewController;
/** 点击进入主页的按钮 */
@property (nonatomic, strong) UIButton *intoButton;

@end
