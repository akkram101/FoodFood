//
//  HomeFoodViewModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import Foundation

class HomeFoodViewModel {
    
    var topHomeAd: [HomeTopAdModel] = []
    var nearestRestaurants: [RestaurantModel] = []
    var popularMenu: [FoodModel] = []
    var homeTableCellHeights: [CGFloat] = [0,0,0,0]
    var totalTableHeight: CGFloat {
        get {
            var totalHeight: CGFloat = 0
            homeTableCellHeights.forEach {totalHeight += $0}
            
            return  totalHeight}
    }
    
    typealias RequestHomeTopAdClosure = (_ isSuccess: Bool, _ ads:[HomeTopAdModel]) -> Void
    typealias RequestRestaurantsClosure = (_ isSuccess: Bool, _ models: [RestaurantModel]) -> Void
    typealias RequestMenuClosure = (_ isSuccess: Bool, _ models: [FoodModel]) -> Void
    
    func requestTopHomeAd(withCompletion completion: @escaping (RequestHomeTopAdClosure)) {
        
        //API
        
        homeTableCellHeights[0] = 180
        homeTableCellHeights[3] = 180
        
        let requestedData = [HomeTopAdModel(), HomeTopAdModel(), HomeTopAdModel()]
        topHomeAd = requestedData
        completion(true,requestedData)
    }
    
    func requestNearestRestaurants(withCompletion completion: @escaping (RequestRestaurantsClosure)) {
        
        //API
        
        let success = true
        
        if success {
            let requestedData = [RestaurantModel(), RestaurantModel(), RestaurantModel(), RestaurantModel(), RestaurantModel(), RestaurantModel(), RestaurantModel(), RestaurantModel()]
            nearestRestaurants = requestedData
            homeTableCellHeights[1] = 180
            completion(true,requestedData)
        } else {
            homeTableCellHeights[1] = 0
            completion(false, [])
        }
    }
    
    func requestPopularMenu(withCompletion completion: @escaping (RequestMenuClosure)) {
        
        //API
        
        let success = true
        
        if success {
            let requestedData = [FoodModel(), FoodModel(), FoodModel(), FoodModel(), FoodModel()] // Only 5 will display in Home
            popularMenu = requestedData
            
            homeTableCellHeights[2] = 500
            completion(true,requestedData)
        } else {
            homeTableCellHeights[2] = 0
            completion(false, [])
        }
    }
    
}
