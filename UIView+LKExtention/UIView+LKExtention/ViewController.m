//
//  ViewController.m
//  UIView+LKExtention
//
//  Created by zero on 16/4/18.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "ViewController.h"
#import "UIView+JLKEazyFrameSet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.x = 20;
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end