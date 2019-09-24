//
//  AppDelegate.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/17.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }
    
    private lazy var applicationCoordinator: Coordinator = ApplicationCoordinator(router: Router(rootController: self.rootController), coordinatorFactory: CoordinatorFactory())

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationVC = UINavigationController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationVC
        self.window?.makeKeyAndVisible()
        self.applicationCoordinator.start(with: nil)
        return true
    }

}

