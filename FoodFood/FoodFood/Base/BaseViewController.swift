//
//  BaseViewController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/30/23.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    var isShowCustomNav: Bool = false
    var isCanGoBack: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        print(AppConfig.API)
        
    }
    
    private func setupUI() {
        navigationController?.navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        view.addSubview(bgView)
        
        if isShowCustomNav {
            view.addSubview(customNav)
            customNav.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(ABLength.kStatusBarHeight)
                make.left.right.equalToSuperview()
                make.height.equalTo(adapt(ABLength.kNavBarHeight))
            }
        }
    }
    
    private lazy var bgView : UIImageView = {
        let view = UIImageView.init(frame: view.bounds)
        view.image = UIImage.init(named: "bg_pattern")
        
        return view
    }()
    
    private lazy var customNav: CustomNavBar = {
       let nav = CustomNavBar()
        nav.delegate = self
        nav.navTitleLabel.text = title
        nav.isCanGoBack = isCanGoBack
        
        return nav
    }()
}

extension BaseViewController: CustomNavBarDelegate {
    func customNavBar(_ navBar: CustomNavBar, didClickBackBtn btn: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
