//
//  ChatsViewController+UITableViewDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/12/23.
//

import Foundation
import UIKit

extension ChatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return adapt(100)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChatDetailViewController()
        vc.isShowCustomNav = true
        
        AppManager.rootViewController()?.pushViewController(vc, animated: true)
    }
}
