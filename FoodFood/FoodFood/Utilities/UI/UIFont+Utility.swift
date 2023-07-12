//
//  UIFont+Utility.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/30/23.
//

import Foundation
import UIKit

extension UIFont {
    
    class func regular(size: CGFloat) -> UIFont {
        return UIFont.init(name: "BentonSans-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func medium(size: CGFloat) -> UIFont {
        return UIFont.init(name: "BentonSans-Medium", size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    class func bold(size: CGFloat) -> UIFont {
        return UIFont.init(name: "BentonSans-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    class func scaleRegular (size: CGFloat) -> UIFont {
        return UIFont.init(name: "BentonSans-Bold", size: size * ABLength.scale) ?? UIFont.systemFont(ofSize: size * ABLength.scale)
    }
    
    class func scaleMedium(size: CGFloat) -> UIFont {
        return UIFont.init(name: "BentonSans-Medium", size: size * ABLength.scale) ?? UIFont.systemFont(ofSize: size * ABLength.scale, weight: .medium)
    }
    
    class func scaleBold(size: CGFloat) -> UIFont {
        return UIFont.init(name: "BentonSans-Bold", size: size * ABLength.scale) ?? UIFont.systemFont(ofSize: size * ABLength.scale, weight: .bold)
    }
    
}
