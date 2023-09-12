//
//  FilterSearchVC+FiltersCollectionDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/12/23.
//

import Foundation

extension FilterSearchVC: FiltersCollectionDelegate {
    func filtersCollection(_ filterCollection: FiltersCollection, didSelectFilter filter: FilterCriterion) {
        vm.addFilter(filter)
    }
    
    func filtersCollection(_ filterCollection: FiltersCollection, didUnselectFilter filter: FilterCriterion) {
        vm.removeFilter(filter)
    }
    

}
