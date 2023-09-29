//
//  BaseFoodModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/17/23.
//

import Foundation

class BaseFoodModel {
    var restaurantName = ["Chris Tower", "Pasada"].randomElement() ?? ""
    var productID = "Green_Noodle123"
    var itemName = ["Green Noodle", "Jollibee", "Lebron James"].randomElement() ?? ""
    var itemPrice = 15.0
    var tags: [Int] = [1,2]
    var imageUrl = BaseFoodModel.randomImage()
    
    static let imageArray = ["green_noodle","detailFoodImg"]
    
    static func randomImage() -> String {
        return imageArray.randomElement() ?? ""
    }
}
