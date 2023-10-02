//
//  UserProfileTable+UITableViewDataSource.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/2/23.
//

import Foundation
import UIKit

extension UserProfileTableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return UserProfileSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = UserProfileSections(rawValue: indexPath.section)
        
        switch section {
        case .memberSection:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserHeaderMemberCell.reuseIdentifier, for: indexPath) as? UserHeaderMemberCell else { return UITableViewCell() }
            
            cell.updateLevel(viewModel.memberLevel)
            return cell
        case .userInfoSection:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserProfileInfoCell.reuseIdentifier, for: indexPath) as? UserProfileInfoCell else { return UITableViewCell() }
            
            return cell
        case .voucherSection:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserVouchersCell.reuseIdentifier, for: indexPath) as? UserVouchersCell else { return UITableViewCell() }
            
            cell.updateVoucher(count: viewModel.vouhcerInfo.count)
            return cell
        case .cartSection:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserFavorites.reuseIdentifier, for: indexPath) as? UserFavorites else { return UITableViewCell() }
            
            cell.favoriteItems = UserProfileViewModel.favoriteItems
            return cell
        case .none:
            return UITableViewCell()
        }
    }
    
    
}
