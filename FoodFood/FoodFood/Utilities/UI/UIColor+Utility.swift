//
//  UIColor+Utility.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
            var hexValue = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            if hexValue.hasPrefix("#") {
                hexValue.remove(at: hexValue.startIndex)
            }

            var rgb: UInt64 = 0
            Scanner(string: hexValue).scanHexInt64(&rgb)

            let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(rgb & 0x0000FF) / 255.0

            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
    
}
