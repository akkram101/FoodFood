//
//  CartManager.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/2/23.
//

import Foundation

protocol CartManagerDelegate: AnyObject {
    func addedToCart()
}

class CartManager {
    
    var cartItems: [CartItemModel] = []
    
    static let shared = CartManager()
    
    weak var delegate: CartManagerDelegate?
    
    class func addToCart(_ item: BaseFoodModel, quantity: Int) {
        let newItem = CartItemModel(item: item, quantity: quantity)
        
        if shared.cartItems.contains(where: {$0.item.productID == item.productID}),
           let model = shared.cartItems.first(where: {$0.item.productID == item.productID}){
            model.quantity += quantity
            shared.delegate?.addedToCart()
            return
        }
        
        shared.cartItems.append(newItem)
        CartManager.counter += 1
        shared.delegate?.addedToCart()
    }
    
    class func removeItem(_ item: BaseFoodModel) {
        shared.cartItems.removeAll(where: { $0.item.productID == item.productID })
    }
    
    static var counter: Int = 0
    
}
