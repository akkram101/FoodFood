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
    var favoriteItems: [BaseFoodModel] = []
    var vouhcerInfo: [VoucherInfo] = []
    
    //TODO: - TEMPORARY STORAGE OF FAVORITE ITEMS
    static var favoriteItems: [BaseFoodModel] = []
    
    typealias ExtraInfoCompletion = (_ memberLevel: MemberLevel,_ favoriteItems: [BaseFoodModel], _ voucherInfo: [VoucherInfo]) -> Void
    
    func requestUserExtraInfo(completion: @escaping (ExtraInfoCompletion)) {
        //API
        let voucher = VoucherInfo(voucherID: "asdasd")
        
        
        self.userExtraInfo = UserExtraInfoModel(userID: "")
        self.memberLevel = .gold
        self.favoriteItems = UserProfileViewModel.favoriteItems
        self.vouhcerInfo = Array.init(repeating: voucher, count: 3)
        
        completion(self.memberLevel, self.favoriteItems, self.vouhcerInfo)
    }
}
