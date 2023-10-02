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
    
    func signUpUser(username: String, email: String, phoneNum: String? = nil, password: String, completion: @escaping SignUpClosure) {
        
        //API
        SignUpManager.signUpUserWith(email: email, password: password, phoneNum: phoneNum ?? "") { isSuccess in
            UserManager.shared.userInfo = UserModel(userID: "", userName: "Yumiii", email: "anamwp66@gmail.com", firstName: "Ayumi", middleName: "Test", lastName: "Orochimaru", nickName: "TEsttt", phoneNum: phoneNum ?? "", address: "Address", avatar: "randomImg")
            completion(isSuccess)
        }
    }
}
