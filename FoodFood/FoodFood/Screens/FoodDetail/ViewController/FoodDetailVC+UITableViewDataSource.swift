//
//  FoodDetailVC+UITableViewDataSource.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/26/23.
//

import Foundation
import UIKit

extension FoodDetailVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let section = indexPath.section
        
        if section == 0 {
            cell.backgroundColor = .systemTeal
        }
        
        if section == 1 {
            cell.backgroundColor = .systemBlue
        }
        
        if section == 2 {
            cell.backgroundColor = .systemPink
        }
        
        if section == 3 {
            cell.backgroundColor = .green
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
}
