//
//  HomeFoodController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/27/23.
//

import UIKit

class HomeFoodController: BaseViewController {
    
    var viewModel = HomeFoodViewModel()
    
    @objc private func notiBtnAction(_ btn: UIButton) {
        print("Notification clicked")
    }
    
    private func requestData() {
        viewModel.requestTopHomeAd { ads in
            
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(findFoodLabel)
        findFoodLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(adapt(50) + ABLength.kStatusBarHeight)
            make.left.equalToSuperview().offset(adapt(20))
        }
        
        view.addSubview(notificationBell)
        notificationBell.snp.makeConstraints { make in
            make.centerY.equalTo(findFoodLabel)
            make.right.equalToSuperview().offset(adapt(-20))
            make.width.height.equalTo(adapt(50))
        }
        
        view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.top.equalTo(findFoodLabel.snp.bottom).offset(adapt(20))
            make.left.equalTo(findFoodLabel)
            make.right.equalTo(notificationBell).offset(adapt(-10))
            make.height.equalTo(SearchView.searchHeight)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupUI()
    }


    private lazy var findFoodLabel: UILabel = {
        let label = UILabel()
        label.text = "Find Your\nFavorite Food"
        label.numberOfLines = 0
        label.font = .scaleBold(size: 31)
        label.center = self.view.center

        return label
    }()
    
    private lazy var notificationBell: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.setImage(KImage("icon_notificationBell"), for: .normal)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(notiBtnAction(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var searchView: SearchView = {
       let searchV = SearchView()
        searchV.delegate = self
        
        return searchV
    }()
}

