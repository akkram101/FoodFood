//
//  OnboardingViewController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/13/23.
//

import UIKit
import SnapKit

protocol OnboardingViewControllerDelegate: AnyObject {
    func nextStep(_ viewController: OnboardingViewController)
}

class OnboardingViewController: UIViewController {
    
    weak var delegate: OnboardingViewControllerDelegate?
    
    @objc func nextBtnAction(_ btn:UIButton) {
        self.delegate?.nextStep(self)
    }
    
    func updateWithModel(_ model: OnboardingModel) {
        onboardingImg.image = UIImage.init(named: model.imgStr)
        maintTitleLbl.text = model.mainTitle
        subLabel.text = model.subTitle
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        
        view.addSubview(onboardingImg)
        onboardingImg.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(adapt(87))
            make.left.right.equalToSuperview()
            make.height.equalTo(adapt(384))
        }
        
        view.addSubview(maintTitleLbl)
        maintTitleLbl.snp.makeConstraints { make in
            make.top.equalTo(onboardingImg.snp.bottom).offset(adapt(32))
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(subLabel)
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(maintTitleLbl.snp.bottom).offset(adapt(20))
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(nextBtn)
        nextBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(adapt(-ABLength.kSafeBottom - 50))
            make.centerX.equalToSuperview()
            make.width.equalTo(adapt(157))
            make.height.equalTo(adapt(57))
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private lazy var onboardingImg: UIImageView = {
        let imgV = UIImageView()
        
        return imgV
    }()
    
    private lazy var maintTitleLbl: UILabel = {
        let label = UILabel()
        label.font = .scaleBold(size: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var subLabel: UILabel = {
        let label = UILabel()
        label.font = .scaleRegular(size: 12)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var nextBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
         btn.setTitle("Next", for: .normal)
         btn.titleLabel?.font = .scaleBold(size: 16)
         btn.setTitleColor(.white, for: .normal)
         btn.backgroundColor  = .systemGreen
        
         btn.clipsToBounds = true
         btn.layer.cornerRadius = adapt(15)
         
         btn.addTarget(self, action: #selector(nextBtnAction(_:)), for: .touchUpInside)
        
         return btn
    }()
    
}
