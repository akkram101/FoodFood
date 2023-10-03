//
//  MainTabbarViewController+HomeFoodControllerDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/3/23.
//

import Foundation

extension MainTabbarViewController: HomeFoodControllerDelegate {
    func homeFoodVC(_ viewController: HomeFoodController, didScrollDown isScrollDown: Bool) {
        if isScrollDown {
            self.hideTabbar()
        } else {
            self.showTabbar()
        }
    }
}
