//
//  FoodDetailViewModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/25/23.
//

import UIKit

class FoodDetailViewModel {

    let productID: String
    var foodDetailModel: FoodDetailModel = FoodDetailModel()
    
    //for uniformity purposes
    var baseModel: BaseFoodModel = BaseFoodModel()
    
    
    
    init(productID: String) {
        self.productID = productID
    }
    
    func updateWithBaseModel(_ detailModel: FoodDetailModel) -> FoodDetailModel {
        detailModel.foodName = baseModel.itemName
        detailModel.imageName = baseModel.imageUrl
        
        return detailModel
    }
    
    typealias RequestDetailsClosure = (_ isSuccess: Bool, _ detail: FoodDetailModel) -> Void
    typealias RequestReviewsClosure = (_ isSuccess: Bool, _ reviews: [FoodRatingModel]) -> Void
    
    
    func requestMoreDetails(completion: @escaping RequestDetailsClosure) {
        self.foodDetailModel = FoodDetailModel()
        
        //for uniformity purposes
        self.foodDetailModel = self.updateWithBaseModel(self.foodDetailModel)
        
        completion(true, self.foodDetailModel)
    }
    
    func requestReviews(completion: @escaping RequestReviewsClosure) {
        
    }
}
