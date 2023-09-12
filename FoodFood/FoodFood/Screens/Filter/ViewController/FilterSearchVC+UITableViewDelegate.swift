//
//  FilterSearchVC+UITableViewDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import Foundation
import UIKit

extension FilterSearchVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleLabel = UILabel()
        titleLabel.font = .scaleBold(size: 15)
        
        let view = UIView()
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        if section == 0 { titleLabel.text = "Type" }
        if section == 1 { titleLabel.text = "Location" }
        if section == 2 { titleLabel.text = "Food" }
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return adapt(30)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 { return adapt(50) }
        if indexPath.section == 1 { return adapt(50) }
        if indexPath.section == 2 { return adapt(calculateRowHeight(with: vm.foodsData, withWidth: self.tableView.frame.size.width)) }
        
        return 0
    }
}
