//
//  FirstLunchViewController.swift
//  LunchView_Swift
//
//  Created by zero on 16/4/27.
//  Copyright © 2016年 zero. All rights reserved.
//

import UIKit

class FirstLunchViewController: UIViewController {
    
    private lazy var animator: FirstLunchAnimator = {
        return FirstLunchAnimator()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.redColor()
        
        let button = UIButton(type: .Custom)
        button.frame = CGRectMake(0, 0, 100, 40)
        button.center = view.center
        button.setTitle("引导界面", forState: .Normal)
        button.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        button.addTarget(self, action: #selector(presentToLunchVC), forControlEvents: .TouchUpInside)
        view.addSubview(button)
    }
    
    func presentToLunchVC() {
        let sb = UIStoryboard(name: "MainViewController", bundle: nil)
        let mainVC = sb.instantiateInitialViewController()
        mainVC?.transitioningDelegate = animator
        mainVC?.modalPresentationStyle = .Custom
        self.presentViewController(mainVC!, animated: true, completion: nil)
    }
}