//
//  CartItemModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/3/23.
//

import Foundation

class CartItemModel {
    let item: BaseFoodModel
    var quantity: Int
    
    init(item: BaseFoodModel, quantity: Int) {
        self.item = item
        self.quantity = quantity
    }
}
