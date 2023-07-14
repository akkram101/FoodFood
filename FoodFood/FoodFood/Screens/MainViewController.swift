//
//  ViewController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/27/23.
//

import UIKit

class MainViewController: BaseViewController {
    
    private func checkLoginAndPresentAuthentication() {
        SessionManager.isLogin = false
        if SessionManager.isLogin == false {
            let vc = SignUpViewController()
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        checkLoginAndPresentAuthentication()
       
        view.addSubview(AppLabel)
    }


    private lazy var AppLabel: UILabel = {
        let label = UILabel()
        label.text = "Main Screen"
        label.font = .scaleBold(size: 40)
        label.frame = CGRect(x: 0, y: 0, width: ABLength.kScreenWidth, height: 100)
        label.center = self.view.center

        return label
    }()
}

