//
//  FilterSearchVC+UITableViewDataSource.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import Foundation
import UIKit

extension FilterSearchVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FiltersCollection.reuseIdentiier, for: indexPath) as? FiltersCollection  else { return UITableViewCell() }
        
        
        switch indexPath.section {
        case 0:
            cell.data = vm.typesData
        case 1:
            cell.data = vm.locationsData
        case 2:
            cell.data = vm.foodsData
        default:
            break
        }
        
        cell.delegate = self
        return cell
    }
    
    
}

