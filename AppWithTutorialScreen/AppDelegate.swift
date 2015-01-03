//
//  AppDelegate.swift
//  AppWithTutorialScreen
//
//  Created by Jon Friskics on 1/2/15.
//  Copyright (c) 2015 Jon Friskics. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let rootVC = RootViewController()

        window?.rootViewController = rootVC
        
        window?.makeKeyAndVisible()
        
        return true
    }

}

