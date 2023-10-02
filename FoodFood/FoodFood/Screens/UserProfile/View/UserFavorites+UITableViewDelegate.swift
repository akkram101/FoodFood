//
//  UserFavorites+UITableViewDataSource.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/2/23.
//

import Foundation
import UIKit

extension UserFavorites: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserProfileViewModel.favoriteItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteItemCell.reuseIdentifier, for: indexPath) as? FavoriteItemCell else { return UITableViewCell() }
        
        cell.configure(withModel: UserProfileViewModel.favoriteItems[indexPath.row])
        return cell
    }
    
    
}
