//
//  FirstLunchAnimator.m
//  LunchView
//
//  Created by zero on 16/4/27.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "FirstLunchAnimator.h"

@interface FirstLunchAnimator()

@end

@implementation FirstLunchAnimator

#pragma mark - UIViewControllerTransitioningDelegate -
// 返回负责转场的控制器对象
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    UIPresentationController *controller = [[UIPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return controller;
}

// 只要使用了一下方法, 动画所需的所有特效以及参数都需要程序员自己设定
/**
 指定展现动画的控制器
 
 - parameter presented:  被展示的控制器
 - parameter presenting: 推出控制器的控制器
 
 - returns: 指定转场控制器
 */
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self;
}

/**
 指定消失动画的控制器
 
 - parameter dismissed: 被消失的控制器
 
 - returns: 指定转场控制器
 */
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning -
/**
 *  指定动画执行时长
 *
 *  @param transitionContext 上下文
 *
 *  @return 动画执行时长
 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

/**
 *  每次转场都会调用的方法
 *
 *  @param transitionContext 上下文
 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // 1. 获取视图
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    toView.alpha = 0.0;
    // 2. 添加视图到控制器中
    [[transitionContext containerView] addSubview:toView];
    // 3. 执行动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.alpha = 1;
    } completion:^(BOOL finished) {
        // 一定要执行这行代码, 否则会出现未知错误
        [transitionContext completeTransition:YES];
        // 移除视图
        //[fromView removeFromSuperview];
    }];
}

@end
