//
//  CartViewController+UITableViewDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/3/23.
//

import Foundation
import UIKit

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return adapt(100)
    }
    
    
}
