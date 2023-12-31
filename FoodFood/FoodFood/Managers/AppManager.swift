//
//  AppManager.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/4/23.
//

import Foundation
import UIKit

class AppManager {
    
    class func rootViewController() -> UINavigationController? {
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
           let rootViewController = appDelegate.window?.rootViewController as? UINavigationController {
            return rootViewController
        }
        
        return nil
    }
    
    class func topViewController() -> UIViewController? {
        if let keyWindow = UIApplication.shared.keyWindow,
           var topViewController = keyWindow.rootViewController {
            while let presentedViewController = topViewController.presentedViewController {
                topViewController = presentedViewController
            }
            return topViewController
        }
        
        return nil
    }
    
    class func currentViewController() -> UIViewController? {
        if let keyWindow = UIApplication.shared.keyWindow,
            let rootViewController = keyWindow.rootViewController {
            var currentViewController: UIViewController? = rootViewController
            
            while let presentedViewController = currentViewController?.presentedViewController {
                currentViewController = presentedViewController
            }
            
            return currentViewController
        }
        
        return nil
    }
    
    class func tabBarController() -> MainTabbarViewController? {
        if let keyWindow = UIApplication.shared.keyWindow,
            let rootViewController = keyWindow.rootViewController {
            var currentViewController: UIViewController? = rootViewController
            
            while let presentedViewController = currentViewController?.presentedViewController {
                currentViewController = presentedViewController
            }
            
            if let tabBarController = currentViewController as? MainTabbarViewController {
                return tabBarController
            } else if let navigationController = currentViewController as? UINavigationController,
                let tabBarController = navigationController.topViewController as? MainTabbarViewController {
                return tabBarController
            }
        }
        
        return nil
    }
    
    class func resetRootVCToHomeVC() {
        if let currentNavController = AppManager.rootViewController() {
            currentNavController.popToRootViewController(animated: true)
            let rootVC = UINavigationController(rootViewController: MainTabbarViewController())

            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.rootViewController = rootVC
                keyWindow.makeKeyAndVisible()
            }
        }
    
    }
    
    class func resetRootToSignUPVC() {
        if let currentNavController = AppManager.rootViewController() {
            currentNavController.popToRootViewController(animated: true)
            let rootVC = UINavigationController(rootViewController: SignUpViewController())

            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.rootViewController = rootVC
                keyWindow.makeKeyAndVisible()
            }
        }
    
    }
}
