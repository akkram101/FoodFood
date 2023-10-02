//
//  UserModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/2/23.
//

import Foundation

class UserModel {
    let userID: String
    let userName: String
    let email: String
    let firstName: String
    let middleName: String
    let lastName: String
    let nickName: String
    let phoneNum: String
    let address: String
    let avatar: String
    
    init(userID: String, userName: String, email: String, firstName: String, middleName: String, lastName: String, nickName: String, phoneNum: String, address: String, avatar: String) {
        self.userID = userID
        self.userName = userName
        self.email = email
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.nickName = nickName
        self.phoneNum = phoneNum
        self.address = address
        self.avatar = avatar
    }
    
}
