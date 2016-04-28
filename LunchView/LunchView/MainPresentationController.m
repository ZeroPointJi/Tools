//
//  MainPresentationController.m
//  LunchView
//
//  Created by zero on 16/4/27.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "MainPresentationController.h"

@implementation MainPresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    
    return self;
}

- (void)containerViewWillLayoutSubviews
{
    //[self presentedView].backgroundColor = [UIColor blueColor];
}

- (BOOL)shouldRemovePresentersView
{
    return YES;
}

@end
