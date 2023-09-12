//
//  FilterSearchVM.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import Foundation

protocol FilterSearchViewModelDelegate: AnyObject {
    func filterVM(_ viewModel: FilterSearchVM, didAddFilter filter: FilterCriterion, inModel model: FilterModel)
    func filterVM(_ viewModel: FilterSearchVM, didRemoveFilter filter: FilterCriterion, inModel model: FilterModel)
    func filterVM(_ viewModel: FilterSearchVM, didResetFiltersInModel model: FilterModel)
}

class FilterSearchVM {
    
    weak var delegate: FilterSearchViewModelDelegate?
    
    var savedFoodsData: [FilterCriterion] = []
    
    var typesData: [FilterCriterion] = []
    var locationsData: [FilterCriterion] = []
    var foodsData: [FilterCriterion] = []
    
    private(set) var model: FilterModel = FilterModel()
    
    func requestAvailableData() {
        //asjdoaisdasdiosado REQUESTINGGGGG
        
        typesData = [FilterType.restaurant, FilterType.menu]
        
        locationsData = [FilterDistance.near, FilterDistance.notFar, FilterDistance.far]
        
        savedFoodsData = [FoodFilterType.cake, FoodFilterType.soup, FoodFilterType.appetizer, FoodFilterType.mainCourse, FoodFilterType.dessert, FoodFilterType.burger, FoodFilterType.chicken, FoodFilterType.beef, FoodFilterType.drinks,FoodFilterType.pizza, FoodFilterType.chicken]
        foodsData = savedFoodsData
    }
    
    func requestData(withText text: String) {
        if text.isBlank {
            foodsData = savedFoodsData
            return
        }
        foodsData = savedFoodsData.filter{ $0.title.lowercased().contains(text.lowercased()) }
    }
    
    func resetData() {
        foodsData = savedFoodsData
    }
    
    func addFilter(_ filter: FilterCriterion) {
        model.addCriteria(filter)
        self.delegate?.filterVM(self, didAddFilter: filter, inModel: model)
    }
    
    func removeFilter(_ filter: FilterCriterion) {
        model.removeCriteria(filter)
        self.delegate?.filterVM(self, didRemoveFilter: filter, inModel: model)
    }
    
    func resetFilter() {
        model.resetFilter()
        self.delegate?.filterVM(self, didResetFiltersInModel: model)
    }
    
}
