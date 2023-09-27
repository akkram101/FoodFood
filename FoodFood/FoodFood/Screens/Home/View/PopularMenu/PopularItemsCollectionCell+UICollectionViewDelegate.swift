//
//  PopularItemsCollectionCell+UICollectionViewDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import Foundation
import UIKit

extension PopularItemsCollectionCell: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Self.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let foodVM = FoodDetailViewModel(productID: "CheeseCake")
        let detailVC = UINavigationController(rootViewController: FoodDetailVC(viewModel: foodVM))
        
        detailVC.modalPresentationStyle = .overFullScreen
        AppManager.rootViewController()?.present(detailVC, animated: true, completion: {
            APIManager.shortSimulate {
                print("XDXD")
            }
        })
    }
    
}
