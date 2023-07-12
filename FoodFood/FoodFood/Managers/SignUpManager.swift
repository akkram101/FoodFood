//
//  SignUpManager.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/12/23.
//

import Foundation

class SignUpManager {
    
    typealias SignUpClosure = () -> Void
    
    class func signUpUserWith(email: String,
                              password: String,
                              phoneNum: String,
                              completion: @escaping (SignUpClosure)) {
        completion()
    }
    
    class func signUpWithApple( completion: @escaping (SignUpClosure)) {
        completion()
    }
    
    class func signUpWithFacebook( completion: @escaping (SignUpClosure)) {
        completion()
    }
    
    class func signUpWithGoogle( completion: @escaping (SignUpClosure)) {
        completion()
    }
}
