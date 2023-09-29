//
//  FoodDetailTableVC+HeaderTagDetailDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/28/23.
//

import Foundation
import MBProgressHUD

extension FoodDetailTableVC: HeaderTagDetailCellDelegate {
    func cellDidClickLocation(_ foodTagCell: HeaderTagDetailCell) {
        print("Locaiton Clicked")
    }
    
    func cellDidClickFavorite(_ foodTagCell: HeaderTagDetailCell) {
        print("Favorited clicked")
    }
}
