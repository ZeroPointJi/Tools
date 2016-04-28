//
//  AppDelegate.swift
//  LunchView_Swift
//
//  Created by zero on 16/4/27.
//  Copyright © 2016年 zero. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        window?.rootViewController = FirstLunchViewController()
        
        window?.makeKeyAndVisible()
        
        return true
    }
}