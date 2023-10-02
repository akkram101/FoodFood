//
//  AppConfiguration.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import Foundation
import MBProgressHUD



struct AppConfig {
    static var environment: Int {
        guard let environment = Bundle.main.object(forInfoDictionaryKey: "Environment") as? Int else {
            fatalError("Environment value not found in Info.plist")
        }
        return environment
    }
    
    static var API: String {
        let isDev: Bool = AppConfig.environment == 0
        
        return isDev ? "Dev environment API" : "Prod environtment API"
    }
}


class APIManager {
    typealias SimulationClosure = (() -> Void)
    
    class func simulateAPI(_ completion: @escaping SimulationClosure) {
        if let viewController = AppManager.topViewController() {
            let hud = MBProgressHUD.showAdded(to: viewController.view, animated: true)
            hud.label.text = "Loading..."
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                MBProgressHUD.hide(for: viewController.view, animated: true)
                completion()
            })
        }
    }
    
    class func shortSimulate(_ completion: @escaping SimulationClosure) {
        if let viewController = AppManager.topViewController() {
            let hud = MBProgressHUD.showAdded(to: viewController.view, animated: true)
            hud.label.text = "Loading..."
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                MBProgressHUD.hide(for: viewController.view, animated: true)
                completion()
            })
        }
    }
}
