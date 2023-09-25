//
//  SessionManager.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/12/23.
//

import Foundation

class SessionManager {
    
    typealias LoginClosure = (_ isSuccess: Bool) -> Void
    
    static let isLoginKey: String = "isLoginKey"
    
    static var isLogin: Bool {
        get {
            guard let isLogin = UserDefaults.standard.object(forKey: Self.isLoginKey) as? Bool else {
                return false
            }
            
            return isLogin
        }
        
        set {UserDefaults.standard.set(newValue, forKey: Self.isLoginKey) }
    }
    
    class func loginUserWith(email: String,
                             password: String,
                             completion: @escaping (LoginClosure)) {
        
        //API
        APIManager.simulateAPI {
            SessionManager.isLogin = true
            completion(true)
        }
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
        APIManager.simulateAPI() {
            SessionManager.isLogin = false
            AppManager.resetRootVCToHomeVC()
        }
    }
    
    class func checkLoginAndPresentAuthentication() {
        if Self.isLogin == false {
            let vc = SignUpViewController()
            AppManager.currentViewController()?.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    
}
