//
//  AppManager.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/4/23.
//

import Foundation
import UIKit

class AppManager {
    
    class func rootViewController() -> UIViewController? {
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
           let rootViewController = appDelegate.window?.rootViewController {
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
    
    func tabBarController() -> UITabBarController? {
        if let keyWindow = UIApplication.shared.keyWindow,
            let rootViewController = keyWindow.rootViewController {
            var currentViewController: UIViewController? = rootViewController
            
            while let presentedViewController = currentViewController?.presentedViewController {
                currentViewController = presentedViewController
            }
            
            if let tabBarController = currentViewController as? UITabBarController {
                return tabBarController
            } else if let navigationController = currentViewController as? UINavigationController,
                let tabBarController = navigationController.topViewController as? UITabBarController {
                return tabBarController
            }
        }
        
        return nil
    }
}
