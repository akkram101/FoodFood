//
//  UserProfileVC.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/27/23.
//

import UIKit
import SnapKit

class UserProfileVC: BaseDetailVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBase()
        setupUI()
    }

    //Configure BaseDetailVC Properties
    private func configureBase() {
        setNormalOffset(offset: 300)
        setAllowanceToPanUp(50)
        setBackGroundImg("user_photo")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userTableVC.reloadUserData()
    }

    private func setupUI() {
        detailContainer.addSubview(userTableVC.view)
        userTableVC.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        userTableVC.didMove(toParent: self)
    }
    
    private lazy var userTableVC: UserProfileTableVC = {
        let vc = UserProfileTableVC()
        
        return vc
    }()
}
