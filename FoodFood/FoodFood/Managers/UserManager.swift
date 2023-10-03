//
//  UserManager.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/12/23.
//

import UIKit

protocol UserManagerDelegate: AnyObject {
    func testDelegate()
}

class UserManager: NSObject {
    static let shared = UserManager()
    
    
    weak var delegate: UserManagerDelegate?
    
    func triggerDelegate() {
        delegate?.testDelegate()
    }
    
    var userInfo: UserModel? {
        get { return _userInfo }
        set { _userInfo = newValue }
    }
    
    private var _userInfo: UserModel?
}
