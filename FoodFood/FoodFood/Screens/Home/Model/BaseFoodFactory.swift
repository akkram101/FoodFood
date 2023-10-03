//
//  BaseFoodFactory.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/29/23.
//

import Foundation

class BaseFoodFactory {
    
    static let productID1 = "productID1"
    static let productID2 = "productID2"
    static let productID3 = "productID3"
    static let productID4 = "productID4"
    static let productID5 = "productID5"
    static let productID6 = "productID6"
    static let productID7 = "productID7"
    static let productID8 = "productID8"
    static let productID9 = "productID9"
    static let productID10 = "productID10"
    static let productID11 = "productID11"
    
    
    static var foodArray: [BaseFoodModel] = []
    
    class func randomFood() -> BaseFoodModel {
        return foodArray.randomElement() ?? BaseFoodModel()
    }
    
    class func setupFoods() {
        let food1 = BaseFoodModel()
        food1.itemName = "Rainbow Sandwich Sugarless"
        food1.itemShortName = "Rainbow Sandwich"
        food1.productID = BaseFoodFactory.productID1
        food1.imageUrl = "detailFoodImg"
        food1.restaurantName = "Chris Tower"
        food1.tags = ["Popular", "Cake"]
        food1.itemPrice = CGFloat.random(in: 1...20)

        let food2 = BaseFoodModel()
        food2.itemName = "Green Noodle"
        food2.itemShortName = "Green Noodle"
        food2.productID = BaseFoodFactory.productID2
        food2.tags = ["Asian", "Noodles"]
        food2.imageUrl = "green_noodle"
        food2.restaurantName = "Waduhek Restaurant"

        let food3 = BaseFoodModel()
        food3.itemName = "Filipino Chicken Adobo"
        food3.itemShortName = "Chicken Adobo"
        food3.productID = BaseFoodFactory.productID3
        food3.tags = ["Filipino", "Chicken"]
        food3.imageUrl = "food3Img"
        food3.restaurantName = "Panlasang Pinoy"
        
        let food4 = BaseFoodModel()
        food4.itemName = "Butter Burgers"
        food4.itemShortName = "Butter Burgers"
        food4.productID = BaseFoodFactory.productID4
        food4.tags = ["Popular", "Burger"]
        food4.imageUrl = "food4Img"
        food4.restaurantName = "Zark's Borgirs"
        
        let food5 = BaseFoodModel()
        food5.itemName = "Instant Pot Pulled Chicken"
        food5.itemShortName = "Pulled Chicken"
        food5.productID = BaseFoodFactory.productID5
        food5.tags = ["Chicken"]
        food5.imageUrl = "food5Img"
        food5.restaurantName = "Pulling Chicken House"
        
        let food6 = BaseFoodModel()
        food6.itemName = "Cast Iron Rib-Eye Steak"
        food6.itemShortName = "Rib-Eye Steak"
        food6.productID = BaseFoodFactory.productID6
        food6.tags = ["Popular", "Steak"]
        food6.imageUrl = "food6Img"
        food6.restaurantName = "WolfGang XD"
        
        let food7 = BaseFoodModel()
        food7.itemName = "Panko-Crusted Baked Haddock"
        food7.itemShortName = "Baked Haddock"
        food7.productID = BaseFoodFactory.productID7
        food7.tags = ["Pastry"]
        food7.imageUrl = "food7Img"
        food7.restaurantName = "Panlasang Pinoy"
        
        let food8 = BaseFoodModel()
        food8.itemName = " Orecchiette with Sausage and Broccoli Rabe"
        food8.itemShortName = "Orechiette"
        food8.productID = BaseFoodFactory.productID8
        food8.imageUrl = "food8Img"
        food8.tags = ["Orecchiette", "XD"]
        food8.restaurantName = "Ano yung Orecchiette?"
        
        let food9 = BaseFoodModel()
        food9.itemName = "Your Best Grilled Burger"
        food9.itemShortName = "Grilled Burger"
        food9.productID = BaseFoodFactory.productID9
        food9.tags = ["Popular", "Burger"]
        food9.imageUrl = "food9Img"
        food9.restaurantName = "Random Burger Joint"
        
        let food10 = BaseFoodModel()
        food10.itemName = "Tex Mex Burger"
        food10.itemShortName = "Tex Mex Burger"
        food10.tags = ["Burger ulet?", "Burger"]
        food10.productID = BaseFoodFactory.productID10
        food10.imageUrl = "food10Img"
        food10.restaurantName = "Random Burger Joint"
        
        BaseFoodFactory.foodArray.append(food1)
        BaseFoodFactory.foodArray.append(food2)
        BaseFoodFactory.foodArray.append(food3)
        BaseFoodFactory.foodArray.append(food4)
        BaseFoodFactory.foodArray.append(food5)
        BaseFoodFactory.foodArray.append(food6)
        BaseFoodFactory.foodArray.append(food7)
        BaseFoodFactory.foodArray.append(food8)
        BaseFoodFactory.foodArray.append(food9)
        BaseFoodFactory.foodArray.append(food10)
        
//        let food11 = BaseFoodModel()
//        food11.itemName = "Kram Pogi"
//        food11.itemShortName = "Kram"
//        food11.tags = ["Popular", "Masarap"]
//        food11.productID = BaseFoodFactory.productID11
//        food11.imageUrl = "Kram"
//        food11.restaurantName = "Backstreet Boys"
//        BaseFoodFactory.foodArray.append(food11)
       
    }
    
}
