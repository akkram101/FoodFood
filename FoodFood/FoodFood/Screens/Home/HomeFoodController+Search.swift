//
//  HomeFoodController+Search.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import Foundation
import UIKit

extension HomeFoodController: SearchViewDelegate {
    func searchView(_ searchView: SearchView, didInputText searchText: String, withTextField textField: UITextField) {
        print("\(searchText)")
    }
    
    func searchView(_ searchView: SearchView, didClickFilterBtn button: UIButton) {
        print("Filter Button Clicked")
        searchView.animateToMaxWidth()
    }
}
