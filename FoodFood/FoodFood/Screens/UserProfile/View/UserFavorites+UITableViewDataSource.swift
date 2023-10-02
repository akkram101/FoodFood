//
//  UserFavorites+UITableViewDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/2/23.
//

import Foundation
import UIKit

extension UserFavorites: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return FavoriteItemCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView(withTitle: "Favorite")
    }
    
    
    func headerView(withTitle title: String) -> UIView {
        
        let itemsLabel: UILabel
        itemsLabel = UILabel()
        itemsLabel.text = title
        itemsLabel.font = .scaleBold(size: 14)
        
        let headerView = UIView()
        headerView.addSubview(itemsLabel)
        
        itemsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
    
        headerView.backgroundColor = .white
        return headerView
    }
    
}
