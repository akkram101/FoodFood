//
//  FoodRatingModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/25/23.
//

import Foundation

class FoodRatingModel {
    let userID: String
    let userName: String
    let rating: Int
    let review: String
    
    init(userID: String, userName: String, rating: Int, review: String) {
        self.userID = userID
        self.userName = userName
        self.rating = rating
        self.review = review
    }
}
