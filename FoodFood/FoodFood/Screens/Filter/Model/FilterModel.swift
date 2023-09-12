//
//  FilterModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import Foundation
protocol FilterCriterion {
    var title: String { get }
    var identifier: Int { get }
}

enum FilterType: Int, FilterCriterion {

    case restaurant = 0
    case menu = 1
    
    var title: String {
        switch self {
        case .restaurant:
            return "Restaurant"
        case .menu:
            return "Menu"
        }
    }
    
    var identifier: Int {
        return rawValue
    }
}

enum FilterDistance: Int, FilterCriterion {
    
    case near = 10
    case notFar = 11
    case far = 12
    
    var title: String {
        switch self {
        case .near:
            return "1 Km"
        case .notFar:
            return "<10 Km"
        case .far:
            return ">10 Km"
        }
    }
    
    var identifier: Int {
        return rawValue
    }
}

enum FoodFilterType: Int, FilterCriterion {
    case cake = 101
    case soup = 102
    case mainCourse = 103
    case appetizer = 104
    case dessert = 105
    case drinks = 106
    case chicken = 107
    case beef = 108
    case burger = 109
    case pizza = 110
    
    var title: String {
        switch self {
        case .cake:
            return "Cake"
        case .soup:
            return "Soup"
        case .mainCourse:
            return "Main Course"
        case .appetizer:
            return "Appetizer"
        case .dessert:
            return "Dessert"
        case .drinks:
            return "Drinks"
        case .chicken:
            return "Chicken"
        case .beef:
            return "Beef"
        case .burger:
            return "Burger"
        case .pizza:
            return "Pizza"
        }
    }
    
    var identifier: Int {
        return rawValue
    }
}


class FilterModel {
    private(set) var selectedCriteria: [FilterCriterion] = []
    
    func addCriteria(_ criteria: FilterCriterion) {
        if !selectedCriteria.contains(where: { $0.identifier == criteria.identifier }) {
            selectedCriteria.append(criteria)
        }
    }
    
    func removeCriteria(_ criteria: FilterCriterion) {
        selectedCriteria.removeAll { $0.identifier == criteria.identifier }
    }
    
    func resetFilter() {
        selectedCriteria = []
    }
    
    func isCriterionSelected(_ criterion: FilterCriterion) -> Bool {
        return selectedCriteria.contains { $0.identifier == criterion.identifier }
    }
}


