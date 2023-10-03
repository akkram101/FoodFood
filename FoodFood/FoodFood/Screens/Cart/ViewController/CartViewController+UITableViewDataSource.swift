//
//  CartViewController+UITableViewDataSource.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/3/23.
//

import Foundation
import UIKit

extension CartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartItemCell.reuseIdentifier, for: indexPath) as? CartItemCell else {
            return UITableViewCell()
        }
        
        let model = viewModel.cartItems[indexPath.row]
        cell.model = model
        cell.delegate = self
        return cell
    }
}
