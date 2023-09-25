//
//  SignUpManager.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/12/23.
//

import Foundation

class SignUpManager {
    
    typealias SignUpClosure = (_ isSuccess: Bool) -> Void
    
    class func signUpUserWith(email: String,
                              password: String,
                              phoneNum: String,
                              completion: @escaping (SignUpClosure)) {
        APIManager.simulateAPI() {
            //API
            SessionManager.isLogin = true
            completion(true)
        }
    }
    
    class func signUpWithApple( completion: @escaping (SignUpClosure)) {
        completion(true)
    }
    
    class func signUpWithFacebook( completion: @escaping (SignUpClosure)) {
        completion(true)
    }
    
    class func signUpWithGoogle( completion: @escaping (SignUpClosure)) {
        completion(true)
    }
}
