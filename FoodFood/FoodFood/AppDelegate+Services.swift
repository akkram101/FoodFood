//
//  AppDelegate+Services.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/29/23.
//

import Foundation
import UIKit
import AFNetworking

extension AppDelegate {
    func configureRootVC() {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = MainViewController()
    }
    
    func startNetworkMonitor() {
        let reachability = AFNetworkReachabilityManager.shared()
                reachability.startMonitoring()

        switch reachability.networkReachabilityStatus {
        case .notReachable:
            print("No internet connection")
        case .unknown:
            print("Unknown connection")
        case .reachableViaWWAN:
            print("Reached via Cellular data")
        case .reachableViaWiFi:
            print("Reached via wifi connection")
        @unknown default:
            print("What this state")
        }
    }
}
