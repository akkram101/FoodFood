//
//  HomeFoodViewModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import Foundation

class HomeFoodViewModel {
    
    var topHomeAd: [HomeTopAdModel] = []
    var homeTableCellHeights: [CGFloat] = [180,180,180, 180]
    
    typealias RequestHomeTopAdClosure = (_ ads: [HomeTopAdModel]) -> Void
    
    func requestTopHomeAd(withCompletion completion: @escaping (RequestHomeTopAdClosure)) {
        
        //API
        
        let requestedData = [HomeTopAdModel(), HomeTopAdModel(), HomeTopAdModel()]
        topHomeAd = requestedData
        completion(requestedData)
    }
    
}
