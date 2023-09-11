//
//  HomeFoodController+UITableViewDataSource.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import Foundation
import UIKit

extension HomeFoodController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopAdsCell.reuseIdentifier, for: indexPath) as? HomeTopAdsCell {
                
                cell.configureWithModels(viewModel.topHomeAd)
                
                return cell
            }
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NearRestoCollectionCell.reuseIdentifier, for: indexPath) as? NearRestoCollectionCell else {
                return UITableViewCell()
                
            }
                cell.setupUI()
                cell.restaurantModels = viewModel.nearestRestaurants
                return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularItemsCollectionCell.reuseIdentifier, for: indexPath) as? PopularItemsCollectionCell, viewModel.nearestRestaurants.count > 0 else {
                return UITableViewCell()
                
            }
                cell.setupUI()
                cell.foodModels = viewModel.popularMenu
                return cell
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopAdsCell.reuseIdentifier, for: indexPath) as? HomeTopAdsCell {
                
                cell.configureWithModels(viewModel.topHomeAd)
                
                return cell
            }
        }
        
        return UITableViewCell()
    }
}
