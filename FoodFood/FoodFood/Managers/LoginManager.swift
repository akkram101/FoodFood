//
//  LoginManager.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/12/23.
//

import Foundation

class SessionManager {
    
    typealias LoginClosure = (_ isSuccess: Bool) -> Void
    
    class func loginUserWith(email: String,
                             password: String,
                             completion: @escaping (LoginClosure)) {
        completion(true)
    }
    
    class func loginWithApple(completion: @escaping (LoginClosure)) {
        completion(true)
    }
    
    class func loginWithFacebook(completion: @escaping (LoginClosure)) {
        completion(true)
    }
    
    class func loginWithGoogle(completion: @escaping (LoginClosure)) {
        completion(true)
    }
    
    class func logoutUser() {
        
    }
}
