//
//  ItemViewModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import Foundation

class BaseRestaurantModel: Equatable {
    
    static func == (lhs: BaseRestaurantModel, rhs: BaseRestaurantModel) -> Bool {
        return lhs.restaurantID == rhs.restaurantID
    }

    var restaurantID = ""
    var imageURL = ""
    var name = ""
    var shortName = ""
    var distance = Int.random(in: 1...10)
}

class BaseRestaurantDetailModel {
    var baseModel: BaseRestaurantModel = BaseRestaurantModel()
}

class RestaurantFactory {
    
    static let restaurantID1 = "restaurantID1"
    static let restaurantID2 = "restaurantID2"
    static let restaurantID3 = "restaurantID3"
    static let restaurantID4 = "restaurantID4"
    static let restaurantID5 = "restaurantID5"
    static let restaurantID6 = "restaurantID6"
    static let restaurantID7 = "restaurantID7"
    static let restaurantID8 = "restaurantID8"
    static let restaurantID9 = "restaurantID9"
    static let restaurantID10 = "restaurantID10"
    
    static var restaurants: [BaseRestaurantModel] = []
    
    class func randomRestaurant() -> BaseRestaurantModel {
        return restaurants.randomElement() ?? BaseRestaurantModel()
    }
    
    
    
    class func createRestaurant() {
        let model1 = BaseRestaurantModel()
        model1.imageURL = "rest1"
        model1.name = "McDonald's"
        model1.shortName = "McDonald's"
        model1.restaurantID = restaurantID1

        let model2 = BaseRestaurantModel()
        model2.imageURL = "rest2"
        model2.name = "Subway"
        model2.shortName = "Subway"
        model2.restaurantID = restaurantID2

        let model3 = BaseRestaurantModel()
        model3.imageURL = "rest3"
        model3.name = "Starbucks"
        model3.shortName = "Starbucks"
        model3.restaurantID = restaurantID3

        let model4 = BaseRestaurantModel()
        model4.imageURL = "rest4"
        model4.name = "Kentucky Fried Chicken"
        model4.shortName = "KFC"
        model4.restaurantID = restaurantID4

        let model5 = BaseRestaurantModel()
        model5.imageURL = "rest5"
        model5.name = "Burger King"
        model5.shortName = "Burger King"
        model5.restaurantID = restaurantID5

        let model6 = BaseRestaurantModel()
        model6.imageURL = "rest6"
        model6.name = "Domino's"
        model6.shortName = "Domino's"
        model6.restaurantID = restaurantID6

        let model7 = BaseRestaurantModel()
        model7.imageURL = "rest7"
        model7.name = "Pizza Hut"
        model7.shortName = "Pizza Hut"
        model7.restaurantID = restaurantID7

        let model8 = BaseRestaurantModel()
        model8.imageURL = "rest8"
        model8.name = "Dunkin' Donuts"
        model8.shortName = "Dunkin' Donuts"
        model8.restaurantID = restaurantID8

        let model9 = BaseRestaurantModel()
        model9.imageURL = "rest9"
        model9.name = "Wendy's"
        model9.shortName = "Wendy's"
        model9.restaurantID = restaurantID9

        let model10 = BaseRestaurantModel()
        model10.imageURL = "rest10"
        model10.name = "Mang Inasal"
        model10.shortName = "Mang Inasal"
        model10.restaurantID = restaurantID10

        restaurants.append(model1)
        restaurants.append(model2)
        restaurants.append(model3)
        restaurants.append(model4)
        restaurants.append(model5)
        restaurants.append(model6)
        restaurants.append(model7)
        restaurants.append(model8)
        restaurants.append(model9)
        restaurants.append(model10)

    }
}
