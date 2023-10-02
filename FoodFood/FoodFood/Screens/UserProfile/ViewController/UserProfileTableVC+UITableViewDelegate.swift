//
//  UserProfileTable+UITableViewDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/2/23.
//

import Foundation
import UIKit

extension UserProfileTableVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = UserProfileSections(rawValue: indexPath.section)
        
        switch section {
        case .memberSection:
            return adapt(30)
        case .userInfoSection:
            return UITableView.automaticDimension
        case .voucherSection:
            return adapt(80)
        case .cartSection:
            return CGFloat(UserProfileViewModel.favoriteItems.count * 2) * FavoriteItemCell.cellHeight
        case .none:
            return 0
        }
    }
}
