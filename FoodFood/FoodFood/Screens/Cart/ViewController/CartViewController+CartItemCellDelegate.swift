//
//  CartViewController+CartItemCellDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/3/23.
//

import Foundation

extension CartViewController: CartItemCellDelegate {
    
    func cartItem(_ cell: CartItemCell, updatedModel model: CartItemModel) {
        viewModel.updateModel(model)
        orderSummaryView.configure(withItems: viewModel.cartItems)
    }
    
}
