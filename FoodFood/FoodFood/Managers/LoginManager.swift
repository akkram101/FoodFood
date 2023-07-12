//
//  LoginManager.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/12/23.
//

import Foundation

class LoginManager {
    
    typealias LoginClosure = () -> Void
    
    class func loginUserWith(username: String,
                             password: String,
                             completion: @escaping (LoginClosure)) {
        completion()
    }
    
    class func loginWithApple(completion: @escaping (LoginClosure)) {
        completion()
    }
    
    class func loginWithFacebook(completion: @escaping (LoginClosure)) {
        completion()
    }
    
    class func loginWithGoogle(completion: @escaping (LoginClosure)) {
        completion()
    }
    
    class func logoutUser() {
        
    }
}
