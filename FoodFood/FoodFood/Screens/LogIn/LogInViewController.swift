//
//  LogInViewController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/4/23.
//

import UIKit

class LogInViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        view.addSubview(logoImgV)
        logoImgV.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(KSLength(47))
            make.width.equalTo(KSLength(188))
            make.height.equalTo(KSLength(203))
        }
    }
    
    lazy var logoImgV : UIImageView = {
        let imgV = UIImageView.init(imageName: "Logo")
        return imgV
    }()

}
