//
//  PopularItemsCollection+UICollectionViewDataSource.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import Foundation
import UIKit

extension PopularItemsCollection: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularMenuCell.reuseIdentifier, for: indexPath) as? PopularMenuCell else {
            return UITableViewCell()
        }
        
        cell.configure(withModel: foodModels[indexPath.row])
        return cell
    }
}
