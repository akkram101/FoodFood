//
//  UserProfileVC.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/27/23.
//

import UIKit


class UserProfileVC: BaseDetailVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBase()
    }
    
    //Configure BaseDetailVC Properties
    private func configureBase() {
        setNormalOffset(offset: 300)
        setBackGroundImg("user_photo")
        setBackGroundImg(contentMode: .scaleAspectFit)
    }

    private func setupUI() {
        
    }

}
