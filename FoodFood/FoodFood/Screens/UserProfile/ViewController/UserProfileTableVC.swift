//
//  UserProfileTableVC.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/2/23.
//

import Foundation
import UIKit

enum UserProfileSections: Int, CaseIterable {
case memberSection
case userInfoSection
case voucherSection
case cartSection
}

class UserProfileTableVC: UIViewController {
    let viewModel = UserProfileViewModel()
    
    func reloadUserData() {
        tableView.reloadData()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: adapt(20), bottom: 0, right: adapt(14)))
        }
    }
    
    private func requestData() {
        viewModel.requestUserExtraInfo { memberLevel, cartInfo, voucherInfo in
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        requestData()
    }
    
    //MARK: - Lazy Load
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = true
        tableView.register(UserHeaderMemberCell.self, forCellReuseIdentifier: UserHeaderMemberCell.reuseIdentifier)
        tableView.register(UserProfileInfoCell.self, forCellReuseIdentifier: UserProfileInfoCell.reuseIdentifier)
        tableView.register(UserFavorites.self, forCellReuseIdentifier: UserFavorites.reuseIdentifier)
        tableView.register(UserVouchersCell.self, forCellReuseIdentifier: UserVouchersCell.reuseIdentifier)
        
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = adapt(30)
        tableView.bouncesZoom = false
        tableView.isScrollEnabled = true
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    

}
