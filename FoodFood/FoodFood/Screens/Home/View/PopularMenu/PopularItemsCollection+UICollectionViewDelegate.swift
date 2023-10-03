//
//  PopularItemsCollectionCell+UICollectionViewDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import Foundation
import UIKit

extension PopularItemsCollection: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Self.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Show tabbar
        kPostDefaultNotification(Notifications.showTabBar)
        
        //FoodModel
        let model = foodModels[indexPath.row]
        
        
        let detailVC = FoodDetailVC(model: model)
        detailVC.isShowDismissButton = true
        detailVC.modalPresentationStyle = .overFullScreen
                                              
        //Simulate API
        AppManager.rootViewController()?.present(detailVC, animated: true, completion: {
            APIManager.shortSimulate {
                print("XDXD")
            }
        })
    }
    
}
