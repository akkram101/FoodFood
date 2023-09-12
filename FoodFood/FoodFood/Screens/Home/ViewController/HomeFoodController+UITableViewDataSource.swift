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
        return HomeTableSections.allCases.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch HomeTableSections(rawValue: indexPath.section) {
        case .filterSection:
            if let cell = tableView.dequeueReusableCell(withIdentifier: FiltersCollection.reuseIdentiier, for: indexPath) as? FiltersCollection,
               let filter = viewModel.filter {
                
                cell.data = filter.selectedCriteria
                return cell
            }
        case .topAdsSection:
            if let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopAdsCell.reuseIdentifier, for: indexPath) as? HomeTopAdsCell {
                
                cell.configureWithModels(viewModel.topHomeAds)
                return cell
            }
        case .nearRestSection:
            if let cell = tableView.dequeueReusableCell(withIdentifier: NearRestoCollectionCell.reuseIdentifier, for: indexPath) as? NearRestoCollectionCell {
                
                cell.restaurantModels = viewModel.nearestRestaurants
                return cell
            }
        case .popularMenuSection:
            if let cell = tableView.dequeueReusableCell(withIdentifier: PopularItemsCollectionCell.reuseIdentifier, for: indexPath) as? PopularItemsCollectionCell {
                
                cell.foodModels = viewModel.popularMenu
                return cell
            }
        case .bottomAdsSection:
            if let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopAdsCell.reuseIdentifier, for: indexPath) as? HomeTopAdsCell {
                
                cell.configureWithModels(viewModel.bottomHomeAds)
                return cell
            }
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
}
