//
//  ReviewsDetailTable+UITableViewDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/28/23.
//

import Foundation
import UIKit

extension ReviewsDetailTable: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UserReviewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView(withTitle: "Testimonies")
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
