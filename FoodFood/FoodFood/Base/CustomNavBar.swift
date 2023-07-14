//
//  CustomNavBar.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import Foundation
import UIKit

protocol CustomNavBarDelegate: AnyObject {
    func customNavBar(_ navBar: CustomNavBar, didClickBackBtn btn: UIButton)
}


class CustomNavBar: UIView {
    
    weak var delegate: CustomNavBarDelegate?
    
    var isCanGoBack: Bool = true
    
    @objc private func backBtnAction(_ btn: UIButton) {
        print("Clicked")
        self.delegate?.customNavBar(self, didClickBackBtn: btn)
    }
    

    private func setupUI() {
        backgroundColor = .clear
        
        addSubview(navTitleLabel)
        navTitleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        addSubview(navBackBtn)
        navBackBtn.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(adapt(20))
            make.width.height.equalTo(adapt(50))
        }
        
        navBackBtn.isHidden = isCanGoBack ? false : true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    lazy var navTitleLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = .scaleMedium(size: 12)
        
        return label
    }()
    
    private lazy var navBackBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(KImage("icon_back"), for: .normal)
        btn.addTarget(self, action: #selector(backBtnAction(_:)), for: .touchUpInside)
        
        return btn
    }()
}
