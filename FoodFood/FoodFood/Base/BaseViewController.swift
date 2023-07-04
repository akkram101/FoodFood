//
//  BaseViewController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/30/23.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(bgView)
    }
    
    lazy var bgView : UIImageView = {
        let view = UIImageView.init(frame: view.bounds)
        view.image = UIImage.init(named: "bg_pattern")
        
        return view
    }()
    
}
