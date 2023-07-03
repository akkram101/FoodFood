//
//  DayNightMode.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/30/23.
//

import Foundation
import UIKit

func DayNightImage(_ dayImage: UIImage, _ nightImage: UIImage) -> UIImage {
    guard let isNightMode = UserDefaults.standard.object(forKey: DayNightMode.isNightMode) as? Bool else { return dayImage}
    
    return isNightMode ? nightImage : dayImage
}

class DayNightMode {
    static let isNightMode = "isNightMode"
}
