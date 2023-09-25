//
//  BaseDetailVC.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/25/23.
//

import UIKit
import SnapKit

class BaseDetailVC: BaseViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc private func addToCartBtnAction(_ btn: UIButton) {
        AppManager.rootViewController()?.dismiss(animated: true)
    }
    
    private func setupUI() {

        view.addSubview(mainImgV)
        mainImgV.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(self.view.frame.size.height/2)
        }
        
        view.addSubview(detailContainer)
        detailContainer.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(self.view.frame.size.height/2 + adapt(50))
        }
        
        view.addSubview(addToCartBtn)
        addToCartBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(adapt(-ABLength.kSafeBottom))
            make.left.equalToSuperview().offset(adapt(16))
            make.right.equalToSuperview().offset(adapt(-16))
            make.height.equalTo(adapt(50))
        }
        
    }
    
    private func addChildVC() {
        let foodDetailVC = FoodDetailVC()
        addChild(foodDetailVC)
        foodDetailVC.view.frame = detailContainer.frame
        detailContainer.addSubview(foodDetailVC.view)
        foodDetailVC.didMove(toParent: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addChildVC()
    }
    
    private lazy var mainImgV: UIImageView = {
       let imgV = UIImageView()
        imgV.image = UIImage(named: "detailFoodImg")
        
        return imgV
    }()
    
    private lazy var detailContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = adapt(30)
        view.clipsToBounds = true
        view.backgroundColor = .white
        
        
        return view
        
    }()
    
    private lazy var addToCartBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
         btn.setTitle("Add To Cart", for: .normal)
         btn.titleLabel?.font = .scaleBold(size: 14)
         btn.setTitleColor(.white, for: .normal)
         btn.backgroundColor  = .systemGreen
        
         btn.clipsToBounds = true
         btn.layer.cornerRadius = adapt(15)
         
         btn.addTarget(self, action: #selector(addToCartBtnAction(_:)), for: .touchUpInside)
        
         return btn
    }()

}
