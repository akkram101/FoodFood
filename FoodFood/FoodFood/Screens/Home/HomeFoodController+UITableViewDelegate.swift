//
//  HomeFoodController+UITableViewDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import Foundation
import UIKit

extension HomeFoodController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section < viewModel.homeTableCellHeights.count else { return 0 }
        if indexPath.section == 1 && viewModel.nearestRestaurants.count == 0 { return 0 }
        
        let rowHeight = viewModel.homeTableCellHeights[indexPath.section]
        return adapt(rowHeight)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return UIView()
        case 1:
            return headerView(withTitle: "Nearest Restaurant")
        case 2:
            return headerView(withTitle: "Popular Menu")
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 3 || section == 0 { return 0 }
        return adapt(40)
    }
    
}
