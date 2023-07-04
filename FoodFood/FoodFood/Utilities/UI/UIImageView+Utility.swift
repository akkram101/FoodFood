//
//  UIImageView+Utility.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/4/23.
//

import Foundation
import UIKit

extension UIImageView {
    
    convenience init(imageName: String) {
        self.init(image: UIImage(named: imageName))
    }
}
