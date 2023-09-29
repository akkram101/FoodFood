//
//  BaseFoodModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/17/23.
//

import Foundation

class BaseFoodModel: Equatable {
    static func == (lhs: BaseFoodModel, rhs: BaseFoodModel) -> Bool {
        return lhs.productID == rhs.productID
    }
    
    var restaurantName = ""
    var productID = ""
    var itemName = ""
    var itemShortName = ""
    var tags: [String] = []
    var itemPrice = CGFloat.random(in: 5.0...20.0)
    var imageUrl = ""
}
