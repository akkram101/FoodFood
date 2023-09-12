//
//  FilterSearchVC+FilterSearchViewModelDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/12/23.
//

import Foundation

extension FilterSearchVC: FilterSearchViewModelDelegate {
    
    func filterVM(_ viewModel: FilterSearchVM, didAddFilter filter: FilterCriterion, inModel model: FilterModel) {
        print("xx-- you added filter with Identifier \(filter.identifier)")
        print("model now has \(model.selectedCriteria.count) filters\n")
    }
    
    func filterVM(_ viewModel: FilterSearchVM, didRemoveFilter filter: FilterCriterion, inModel model: FilterModel) {
        print("xx---- you removed filter with Identifier \(filter.identifier)")
        print("model now has \(model.selectedCriteria.count) filters\n")
    }
    
    func filterVM(_ viewModel: FilterSearchVM, didResetFiltersInModel model: FilterModel) {
        tableView.reloadData()
    }
    
}
