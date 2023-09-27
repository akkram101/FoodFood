//
//  FoodDetailVC+UITableViewDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/26/23.
//

import Foundation
import UIKit

extension FoodDetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        if section == 0 {
            return 50
        }
        
        if section == 1 {
            return 100
        }
        
        if section == 2 {
            return 50
        }
        
        if section == 3 {
            return 700
        }
        
        
        
        return 50
    }
}
