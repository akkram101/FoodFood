//
//  ReviewsDetailTable+UITableViewDataSource.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/28/23.
//

import Foundation
import UIKit

extension ReviewsDetailTable: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserReviewCell.reuseIdentifier, for: indexPath) as? UserReviewCell else { return UITableViewCell() }
        
        
        return cell
    }
}
