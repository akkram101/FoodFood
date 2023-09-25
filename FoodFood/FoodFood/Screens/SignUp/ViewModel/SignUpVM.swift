//
//  SignUpVM.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/12/23.
//

import Foundation

class SignUpVM {
    
    typealias SignUpClosure = (_ isSuccess: Bool) -> Void
    
    func checkUserNameValidity(username: String) -> Bool {
        return true
    }
    
    func checkEmailValidity(email: String) -> Bool {
        return email.contains("@") && email.hasSuffix(".com")
    }
    
    func signUpUser(username: String, email: String, password: String, completion: @escaping SignUpClosure) {
        
        //API
        SignUpManager.signUpUserWith(email: email, password: password, phoneNum: password) { isSuccess in
            completion(isSuccess)
        }
    }
}
