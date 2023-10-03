//
//  UserProfileViewModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/2/23.
//

import UIKit

class UserProfileViewModel: NSObject {
    
    var userExtraInfo: UserExtraInfoModel = UserExtraInfoModel.init(userID: UserManager.shared.userInfo?.userID ?? "")
    var memberLevel: MemberLevel = .basic
    var cartInfo: [CartItem] = []
    var vouhcerInfo: [VoucherInfo] = []
    
    //TODO: - TEMPORARY STORAGE OF FAVORITE ITEMS
    static var favoriteItems: [BaseFoodModel] = []
    
    typealias ExtraInfoCompletion = (_ memberLevel: MemberLevel,_ favoriteItems: [BaseFoodModel], _ voucherInfo: [VoucherInfo]) -> Void
    
    func requestUserExtraInfo(completion: @escaping (ExtraInfoCompletion)) {
        //API
        let item = CartItem(productID: "tet", itemName: "test", quantity: 1, totalAmount: 1, restaurantID: "asd")
        
        let voucher = VoucherInfo(voucherID: "asdasd")
        
        
        self.userExtraInfo = UserExtraInfoModel(userID: "")
        self.memberLevel = .gold
        self.cartInfo = [item]
        self.vouhcerInfo = Array.init(repeating: voucher, count: 3)
        
        completion(self.memberLevel, UserProfileViewModel.favoriteItems ,self.vouhcerInfo)
    }
}
