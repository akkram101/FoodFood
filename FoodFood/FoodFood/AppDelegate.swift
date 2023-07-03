//
//  AppDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/27/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configureRootVC()
        startNetworkMonitor()
        
        return true
    }
    
}

