//
//  UserManager.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/12/23.
//

import UIKit

class UserManager: NSObject {
    static let shared = UserManager()
    
    var userInfo: UserModel? {
        get { return _userInfo }
        set { _userInfo = newValue }
    }
    
    private var _userInfo: UserModel?
}
