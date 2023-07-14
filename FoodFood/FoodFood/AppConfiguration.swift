//
//  AppConfiguration.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import Foundation



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
