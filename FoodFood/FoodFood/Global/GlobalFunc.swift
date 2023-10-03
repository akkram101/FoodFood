//
//  GlobalFunc.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/29/23.
//

import Foundation
import UIKit

func KObjectIsEmpty(_ obj: AnyObject?) -> Bool {
    return obj == nil
}

func KImage(_ imageName: String) -> UIImage? {
    return UIImage(named: imageName)
}

func KEmptyIfNil(_ str: String?) -> String {
    return str ?? ""
}

func randomColor() -> UIColor {
    let red = CGFloat.random(in: 0...1)
    let green = CGFloat.random(in: 0...1)
    let blue = CGFloat.random(in: 0...1)
    let alpha = CGFloat.random(in: 0.5...1.0)
    
    let randomColor = UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
    
    return randomColor
}

func kPostDefaultNotification(_ noti : Notification.Name) {
    NotificationCenter.default.post(name: noti, object: nil)
}

func kNotiName(_ notiName: String) -> Notification.Name {
    return Notification.Name(notiName)
}

func KUserFullName() -> String {
    guard let userInfo = UserManager.shared.userInfo else { return ""}
    return "\(userInfo.firstName) \(userInfo.lastName)"
}

func generateUniqueItems<T>(count: Int, generator: () -> T, condition: (T, [T]) -> Bool) -> [T] {
    var uniqueItems: [T] = []
    
    while uniqueItems.count < count {
        let newItem = generator()
         
        if !uniqueItems.contains(where: { existingItem in
            return condition(newItem, [existingItem])
        }) {
            uniqueItems.append(newItem)
        }
    }
    
    return uniqueItems
}
