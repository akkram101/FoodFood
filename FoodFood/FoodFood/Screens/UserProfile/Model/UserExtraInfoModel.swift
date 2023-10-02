//
//  UserExtraInfoModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/2/23.
//

import Foundation

enum MemberLevel: Int {
case basic
case silver
case gold
}

class UserExtraInfoModel {
    let userID: String
    var memberLevel: MemberLevel = .basic
    var favoriteItems: [BaseFoodModel]?
    var voucherDetails: [VoucherInfo]?
    
    init(userID: String) {
        self.userID = userID
    }
}

class CartItem {
    var productID: String
    var itemName: String
    var quantity: Int
    var totalAmount: Int
    var restaurantID: String
    
    init(productID: String, itemName: String, quantity: Int, totalAmount: Int, restaurantID: String) {
        self.productID = productID
        self.itemName = itemName
        self.quantity = quantity
        self.totalAmount = totalAmount
        self.restaurantID = restaurantID
    }
}

class VoucherInfo {
    var voucherID: String
    
    init(voucherID: String) {
        self.voucherID = voucherID
    }
}
