//
//  HomeFoodController+FilterSearchViewControllerDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/12/23.
//

import Foundation

extension HomeFoodController: FilterSearchViewControllerDelegate {
    
    func filterSearch(_ filterSearchViewController: FilterSearchVC, didSearch filterModel: FilterModel) {
        viewModel.addFilter(filterModel)
        homeTableView.reloadData()
    }

}
