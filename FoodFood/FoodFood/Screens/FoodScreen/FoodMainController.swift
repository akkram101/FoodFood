//
//  FoodMainController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/27/23.
//

import UIKit

class FoodMainController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
       
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

