//
//  ChatsViewController+UITableViewDataSource.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/12/23.
//

import Foundation
import UIKit

extension ChatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatPersonCell.reuseIdentifier, for: indexPath) as? ChatPersonCell else { return UITableViewCell() }
        
        return cell
    }
}
