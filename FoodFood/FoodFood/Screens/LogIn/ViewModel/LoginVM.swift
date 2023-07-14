//
//  LoginVM.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/12/23.
//

import Foundation

class LoginVM {
    
    typealias LoginClosure = (_ isSuceess: Bool) -> Void
    
    func login(withEmail email: String, password: String, completion: @escaping (LoginClosure)) {
        SessionManager.loginUserWith(email: email, password: password, completion: completion)
    }
}
