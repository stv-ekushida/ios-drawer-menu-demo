//
//  AppDelegate.swift
//  ios-drawer-menu-demo
//
//  Created by Kushida　Eiji on 2017/03/13.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        createMenuView()
        return true
    }
    
    private func createMenuView() {
        
        let mainViewController = LeftMenu.main.viewController() as! MainViewController
        let leftViewController = UIStoryboard.getViewController(storyboardName: "LeftViewController",
                                                                identifier: "LeftViewController") as! LeftViewController
        
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        
        leftViewController.mainViewController = nvc
        
        let slideMenuController = ExSlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = mainViewController
        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
    }
}

