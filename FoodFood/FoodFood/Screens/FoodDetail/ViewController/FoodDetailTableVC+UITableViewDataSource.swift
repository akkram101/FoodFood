//
//  FoodDetailVC+UITableViewDataSource.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/26/23.
//

import Foundation
import UIKit

extension FoodDetailTableVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let section = indexPath.section
        
        if section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTagDetailCell.reuseIdentifier, for: indexPath) as? HeaderTagDetailCell else { return UITableViewCell() }
            
            cell.tagTitles = ["Popular", FoodFilterType(rawValue: 101)!.title]
            cell.delegate = self
            return cell
        }
        
        if section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailInfoCell.reuseIdentifier, for: indexPath) as? DetailInfoCell else { return UITableViewCell() }
            
            cell.update(detail: viewModel.foodDetailModel)
            return cell
        }
        
        if section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewsDetailTable.reuseIdentifier, for: indexPath) as? ReviewsDetailTable else { return UITableViewCell() }
            
            return cell
        }
        
        
        cell.selectionStyle = .none
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
}
