//
//  RedBadgeView.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/3/23.
//

import UIKit
import SnapKit

class RedBadgeView: UIView {
    
    static let animationDuration = 0.25
    
    var counter: Int = 0 {
        didSet {
           animateBadgeValue(count: counter)
            updateVisibility()
        }
    }
    
    private func animateBadgeValue(count: Int) {
        UIView.transition(with: self.itemCounterLbl,
                          duration: RedBadgeView.animationDuration,
                          options: .curveEaseIn,
                          animations: {
            self.itemCounterLbl.text = "\(count)"
        }, completion: nil)
    }
    
    private func updateVisibility() {
        self.isHidden = counter < 1 ? true : false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        updateVisibility()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    private func setupUI() {
        layer.cornerRadius = adapt(7)
        layer.borderWidth = adapt(1)
        layer.borderColor = UIColor.white.cgColor
        clipsToBounds = true
        backgroundColor = .systemRed
        
        addSubview(itemCounterLbl)
        itemCounterLbl.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
    }
    
    private lazy var itemCounterLbl: UILabel = {
        let label = UILabel()
        label.font = .scaleMedium(size: 9)
        label.textColor = .white
        
        return label
    }()
    
    

}
