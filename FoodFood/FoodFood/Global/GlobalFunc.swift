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

func kPostDefaultNotification(_ noti : String) {
    NotificationCenter.default.post(name: Notification.Name(noti), object: nil)
}

func kNotiName(_ notiName: String) -> Notification.Name {
    return Notification.Name(notiName)
}
