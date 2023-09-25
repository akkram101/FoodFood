//
//  FoodDetailModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/25/23.
//

import Foundation

class FoodDetailModel {
    let description: String
    let originCountry: String
    let rating: CGFloat
    let orderCount: Int

    init(description: String, origin: String, rating: CGFloat, orderCount: Int) {
        self.description = description
        self.originCountry = origin
        self.rating = rating
        self.orderCount = orderCount
    }
}
