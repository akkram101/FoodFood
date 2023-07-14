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
    
    //Screen sizes
    static let iphone6s : CGFloat = 375
    static let kScreenWidth : CGFloat = UIScreen.main.bounds.size.width
    static let kScreenHeight : CGFloat = UIScreen.main.bounds.size.height
    static let kStatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
    static let kNavBarHeight: CGFloat = 44
    
    static let scale : CGFloat = kScreenWidth/iphone6s
    
}
