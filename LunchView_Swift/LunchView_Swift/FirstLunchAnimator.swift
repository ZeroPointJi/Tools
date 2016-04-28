//
//  FirstLunchAnimator.swift
//  LunchView_Swift
//
//  Created by zero on 16/4/27.
//  Copyright © 2016年 zero. All rights reserved.
//

import UIKit

class FirstLunchAnimator: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    // 返回负责转场的控制器对象
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return UIPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
    // 只要使用了一下方法, 动画所需的所有特效以及参数都需要程序员自己设定
    /**
     指定展现动画的控制器
     
     - parameter presented:  被展示的控制器
     - parameter presenting: 推出控制器的控制器
     
     - returns: 指定转场控制器
     */
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // 当展现动画要开始执行的时候,发送通知
        return self
    }
    
    /**
     指定消失动画的控制器
     
     - parameter dismissed: 被消失的控制器
     
     - returns: 指定转场控制器
     */
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // 当消失动画要开始执行的时候,发送通知
        return self
    }
    
    // MARK: -- UIViewControllerAnimatedTransitioning
    /**
     转场动画执行时间
     
     - parameter transitionContext: 上下文, 其中有转场的所有参数
     
     - returns: 执行时间
     */
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    /**
     每次转场动画执行时都会调用的方法
     
     - parameter transitionContext: 上下文, 其中有转场的所有参数
     */
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        print(transitionContext.viewForKey("UITransitionContextToViewKey"))
    }

}
