//
//  ABLength.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/30/23.
//

import Foundation
import UIKit

func adapt(_ len: CGFloat) -> CGFloat {
    return floor(len) * ABLength.scale
}

class ABLength {
    
    static var isIPhoneX: Bool {
        let deviceHeight = UIScreen.main.nativeBounds.height
        return deviceHeight == 2436 || deviceHeight == 2688 || deviceHeight == 1792
    }
    
    //Screen sizes
    static let iphone6s : CGFloat = 375
    static let kScreenWidth : CGFloat = UIScreen.main.bounds.size.width
    static let kScreenHeight : CGFloat = UIScreen.main.bounds.size.height
    static let kStatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
    static let kNavBarHeight: CGFloat = 44
    static let kTabBarHeight: CGFloat = 49.0
    static let kSafeBottom: CGFloat = isIPhoneX ? 0 : 34
    static let scale : CGFloat = kScreenWidth/iphone6s
    
}
