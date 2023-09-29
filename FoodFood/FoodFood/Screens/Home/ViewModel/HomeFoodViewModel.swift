//
//  HomeFoodViewModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import Foundation

enum HomeTableSections: Int, CaseIterable {
    case filterSection = 0
    case topAdsSection = 1
    case nearRestSection = 2
    case popularMenuSection = 3
    case bottomAdsSection = 5
}

class HomeFoodViewModel {
    
    
    //MARK: - DataSource
    var filter: FilterModel?
    var topHomeAds: [HomeTopAdModel] = []
    var nearestRestaurants: [RestaurantModel] = []
    var popularMenu: [BaseFoodModel] = []
    var bottomHomeAds: [HomeTopAdModel] = []
    
    //MARK: - UI Releated
    var homeTableCellHeights: [CGFloat] = Array.init(repeating: 0, count: HomeTableSections.allCases.count + 1)
    var totalTableHeight: CGFloat {
        get {
            var totalHeight: CGFloat = 0
            homeTableCellHeights.forEach {totalHeight += $0}
            
            return  totalHeight
        }
    }
    
    typealias RequestHomeTopAdClosure = (_ isSuccess: Bool, _ ads:[HomeTopAdModel]?) -> Void
    typealias RequestRestaurantsClosure = (_ isSuccess: Bool, _ models: [RestaurantModel]?) -> Void
    typealias RequestMenuClosure = (_ isSuccess: Bool, _ models: [BaseFoodModel]?) -> Void
    
    func requestTopHomeAd(withCompletion completion: @escaping (RequestHomeTopAdClosure)) {
        let tableTopSection = HomeTableSections.topAdsSection.rawValue
        let tableBotSection = HomeTableSections.bottomAdsSection.rawValue
        
        //API
        let isSuccess = true
        
        if isSuccess {
            let voucher1 = HomeTopAdModel()
            voucher1.adImageURL = "voucher_2"
            
            let voucher2 = HomeTopAdModel()
            voucher2.adImageURL = "voucher_3"
            
            let voucher3 = HomeTopAdModel()
            voucher3.adImageURL = "voucher_1"
            
            let requestedData = [voucher1, voucher2, voucher3]
            topHomeAds = requestedData
            bottomHomeAds = requestedData.reversed()
            
            homeTableCellHeights[tableTopSection] = HomeTopAdsCell.cellHeight
            homeTableCellHeights[tableBotSection] = HomeTopAdsCell.cellHeight
            
            completion(true,requestedData)
        } else {
            
            topHomeAds = []
            bottomHomeAds = []
            homeTableCellHeights[tableTopSection] = 0
            homeTableCellHeights[tableBotSection] = 0
            
            completion(false,nil)
        }
    }
    
    func requestNearestRestaurants(withCompletion completion: @escaping (RequestRestaurantsClosure)) {
        let tableSection = HomeTableSections.nearRestSection.rawValue
        
        //API
        let success = true
        
        if success {
            let requestedData = [RestaurantModel(), RestaurantModel(), RestaurantModel(), RestaurantModel(), RestaurantModel(), RestaurantModel(), RestaurantModel(), RestaurantModel()]
            nearestRestaurants = requestedData
            
            //Add tableHeights
            homeTableCellHeights[tableSection] = NearRestoCell.cellHeight
            completion(true,requestedData)
        } else {
            
            //Reset Height
            homeTableCellHeights[tableSection] = 0
            completion(false, nil)
        }
    }
    
    func requestPopularMenu(withCompletion completion: @escaping (RequestMenuClosure)) {
        let tableSection = HomeTableSections.popularMenuSection.rawValue
        
        //API
        let success = true
        
        if success {
            let requestedData = [BaseFoodModel(), BaseFoodModel(), BaseFoodModel(), BaseFoodModel(), BaseFoodModel()] // Only 5 will display in Home
            
            popularMenu = requestedData
            //Add table height
            
            homeTableCellHeights[tableSection] = CGFloat(popularMenu.count) * PopularItemsCollection.rowHeight
            
            completion(true,requestedData)
        } else {
            
            homeTableCellHeights[tableSection] = 0
            completion(false, nil)
        }
    }
    
    func addFilter(_ filterModel: FilterModel) {
        let filterCellHeight = FilterSearchVC().calculateRowHeight(with: filterModel.selectedCriteria, withWidth: 280)
        
        if filterModel.selectedCriteria.isEmpty {
            filter = nil
            homeTableCellHeights[HomeTableSections.filterSection.rawValue] = 0
        } else {
            filter = filterModel
            homeTableCellHeights[HomeTableSections.filterSection.rawValue] = filterCellHeight
        }
    }
    
}
