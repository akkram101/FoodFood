//
//  HomeFoodController+UITableViewDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import Foundation
import UIKit

extension HomeFoodController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight = viewModel.homeTableCellHeights[indexPath.section]
        return adapt(rowHeight)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let nearAPISuccess = !viewModel.nearestRestaurants.isEmpty
        let popularAPISuccess = !viewModel.popularMenu.isEmpty
        
        switch HomeTableSections(rawValue: section) {
        case .filterSection:
            return UIView()
        case .topAdsSection:
            return UIView()
        case .nearRestSection:
            return nearAPISuccess ? headerView(withTitle: "Nearest Restaurant") : UIView()
        case .popularMenuSection:
            return popularAPISuccess ? headerView(withTitle: "Popular Menu") : UIView()
        case .bottomAdsSection:
            return UIView()
        default:
            return UIView()
        }

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let nearAPISuccess = !viewModel.nearestRestaurants.isEmpty
        let popularAPISuccess = !viewModel.popularMenu.isEmpty
        
        switch HomeTableSections(rawValue: section) {
        case .nearRestSection:
            return nearAPISuccess ? adapt(40) : 0
        case .popularMenuSection:
            return popularAPISuccess ? adapt(40) : 0
        default:
            return 0
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentY = scrollView.contentOffset.y
//        print("xx--current: \(currentY)")
//        print("last: \(lastScrollYPosition)")
//        print("TableHeight: \(homeTableHeight)")
        
        //Return when bouncing up
        guard currentY >= 0 else { return }
        
        let isScrollDown = scrollView.contentOffset.y > lastScrollYPosition ? true : false
        self.delegate?.homeFoodVC(self, didScrollDown: isScrollDown)
        lastScrollYPosition = currentY
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Call to show tabbar
        self.delegate?.homeFoodVC(self, didScrollDown: false)
    }
}
