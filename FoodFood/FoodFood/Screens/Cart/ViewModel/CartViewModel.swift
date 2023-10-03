//
//  CartViewModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/3/23.
//

import Foundation

class CartViewModel {
    
    var cartItems: [CartItemModel] = []
    
    typealias CartClosure = (_ isSuccess: Bool,_ cartItems: [CartItemModel] ) -> Void
    
    func requestUserCart(completion:@escaping (CartClosure)) {
        //API
        cartItems = CartManager.shared.cartItems
        completion(true,cartItems)
    }
    
    func updateModel(_ model: CartItemModel) {
        if let modelInCart = cartItems.first(where: {$0.item.productID == model.item.productID}) {
            modelInCart.quantity = model.quantity
        }
        
    }
}
