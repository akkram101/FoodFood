//
//  SignUpVM.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/12/23.
//

import Foundation

class SignUpVM {
    
    typealias SignUpClosure = () -> Void
    
    func checkUserNameValidity(username: String) -> Bool {
        return true
    }
    
    func checkEmailValidity(email: String) -> Bool {
        return email.contains("@") && email.hasSuffix(".com")
    }
    
    func signUpUser(username: String, email: String, password: String, completion: @escaping SignUpClosure) {
        completion()
    }
}
