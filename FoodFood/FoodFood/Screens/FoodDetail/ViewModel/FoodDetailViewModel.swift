//
//  FoodDetailViewModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/25/23.
//

import UIKit

class FoodDetailViewModel {
    
    let productID: String
    
    init(productID: String) {
        self.productID = productID
    }
    
    typealias RequestDetailsClosure = (_ isSuccess: Bool, _ detail: FoodDetailModel) -> Void
    typealias RequestReviewsClosure = (_ isSuccess: Bool, _ reviews: [FoodRatingModel]) -> Void
    
    
    func requestMoreDetails(completion: @escaping RequestDetailsClosure) {
        
    }
    
    func requestReviews(completion: @escaping RequestReviewsClosure) {
        
    }
}
