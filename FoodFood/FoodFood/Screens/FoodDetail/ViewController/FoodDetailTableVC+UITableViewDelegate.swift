//
//  FoodDetailVC+UITableViewDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/26/23.
//

import Foundation
import UIKit

extension FoodDetailTableVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        if section == 0 {
            return adapt(50)
        }
        
        if section == 1 {
            return UITableView.automaticDimension
        }
        
        if section == 2 {
            return UserReviewCell.cellHeight * 9
        }
        
        
        
        return 50
    }
}
