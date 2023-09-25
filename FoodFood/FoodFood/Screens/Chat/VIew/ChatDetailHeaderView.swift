//
//  ChatDetailHeaderView.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/12/23.
//

import UIKit
import SnapKit

class ChatDetailHeaderView: UIView {
    
    @objc private func btnAction(_ btn: UIButton) {
        SessionManager.logoutUser()
    }
    
    private func setupUI() {
        addSubview(containerView)
        let containerInsets = UIEdgeInsets(top: 0,left: 0,
                                          bottom: adapt(20),
                                          right: 0)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(containerInsets)
        }
        
        containerView.addSubview(personImgV)
        personImgV.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(adapt(16))
            make.width.height.equalTo(adapt(62))
        }
        
        containerView.addSubview(personNameLabel)
        personNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(adapt(20))
            make.left.equalTo(personImgV.snp.right).offset(adapt(12))
        }
        
        containerView.addSubview(onlineStatusImgV)
        onlineStatusImgV.snp.makeConstraints { make in
            make.top.equalTo(personNameLabel.snp.bottom).offset(adapt(7))
            make.left.equalTo(personNameLabel)
            make.width.height.equalTo(adapt(6))
        }
        
        containerView.addSubview(onlineStatusLabel)
        onlineStatusLabel.snp.makeConstraints { make in
            make.centerY.equalTo(onlineStatusImgV)
            make.left.equalTo(onlineStatusImgV.snp.right).offset(adapt(5))
        }
        
        containerView.addSubview(callBtn)
        callBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-adapt(28))
            make.width.height.equalTo(adapt(40))
        }
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = adapt(20)
        view.backgroundColor = .white
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.3
        view.layer.shadowColor = UIColor.systemGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        return view
    }()
    
    private lazy var personImgV: UIImageView = {
       let imgV = UIImageView(imageName: "lebron")
        imgV.layer.cornerRadius = adapt(10)
        imgV.contentMode = .scaleAspectFill
        
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let alpha = CGFloat.random(in: 0.5...1.0)
        
        imgV.backgroundColor = UIColor.init(red: red,
                                            green: green,
                                            blue: blue,
                                            alpha: alpha)
        
        return imgV
    }()
    
    private lazy var personNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Lebron James"
        label.font = .scaleBold(size: 15)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var onlineStatusImgV: UIView = {
       let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = adapt(3)
        
        return view
    }()
    
    private lazy var onlineStatusLabel: UILabel = {
       let label = UILabel()
        label.text = Bool.random() ? "Online": "Offline"
        label.font = .scaleMedium(size: 14)
        label.textColor = .systemGray
        
        return label
    }()
    
    private lazy var callBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "icon_call"), for: .normal)
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        
        return btn
    }()

    required init?(coder: NSCoder) {
        fatalError("naiosndiansd")
    }

}
