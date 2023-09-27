//
//  LaterUser.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/26/23.
//

import Foundation
import UIKit

class LaterUserCodes {
    
    
    // MARK: - UIScrollViewDelegate
    static let detailsInset: CGFloat = 150
    var lastYOffset: CGFloat = 0
    var isScrollingUp = false
        
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        
        guard currentOffset > -Self.detailsInset else { return }
        guard currentOffset < 0 else { return }
        
        if lastYOffset > currentOffset {
            isScrollingUp = false
        } else {
            isScrollingUp = true
        }
        
        lastYOffset = currentOffset
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y

        guard currentOffset > -Self.detailsInset else { return }
        guard currentOffset < 0 else { return }
        
        if !decelerate {
            handleScrollEnd()
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y

        guard currentOffset > -Self.detailsInset else { return }
        guard currentOffset < 0 else { return }
        
        handleScrollEnd()
    }
    
    func handleScrollEnd() {
        print("Scroll Ended")
    }
    

}
