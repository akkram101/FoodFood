//
//  AppDelegate+Services.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/29/23.
//

import Foundation
import UIKit
//import AFNetworking

extension AppDelegate {
    func configureRootVC() {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        if SessionManager.isLogin {
            let vc = MainTabbarViewController()
            window?.rootViewController = UINavigationController(rootViewController: vc)
        } else {
            let vc = SignUpViewController()
            window?.rootViewController = UINavigationController(rootViewController: vc)
        }
        
        //test
    
        window?.makeKeyAndVisible()
    }
    
    func additionaSetup() {
        if #available(iOS 13.0, *) {
            // Enforce light mode
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .light
            }
        }
        
        UserManager.shared.userInfo = UserModel(userID: "", userName: "AnneKoi", email: "Aneozeki@gmail.com", firstName: "Faith", middleName: "Test", lastName: "Garcia", nickName: "TEsttt", phoneNum: "", address: "Muntinlupa", avatar: "randomImg")
    }
    
    func startNetworkMonitor() {
//        let reachability = AFNetworkReachabilityManager.shared()
//                reachability.startMonitoring()
//
//        switch reachability.networkReachabilityStatus {
//        case .notReachable:
//            print("No internet connection")
//        case .unknown:
//            print("Unknown connection")
//        case .reachableViaWWAN:
//            print("Reached via Cellular data")
//        case .reachableViaWiFi:
//            print("Reached via wifi connection")
//        @unknown default:
//            print("What this state")
//        }
    }
}
