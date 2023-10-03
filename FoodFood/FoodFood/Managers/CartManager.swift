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
    
    static let shared = CartManager()
    
    weak var delegate: CartManagerDelegate?
    
    class func itemAddedToCart() {
        CartManager.counter += 1
        shared.delegate?.addedToCart()
    }
    
    static var counter: Int = 0
    
}
