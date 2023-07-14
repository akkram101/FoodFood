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
        
        view.addSubview(homeTableView)
        homeTableView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(adapt(20))
            make.left.right.equalToSuperview()
            make.height.equalTo(adapt(500))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        setupUI()
    }
    
    
    private lazy var homeTableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTopAdsCell.self, forCellReuseIdentifier: HomeTopAdsCell.reuseIdentifier)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        return tableView
    }()


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

extension HomeFoodController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.row < viewModel.homeTableCellHeights.count else { return 0 }
        
        let rowHeight = viewModel.homeTableCellHeights[indexPath.row]
        return adapt(rowHeight)
    }
    
}

extension HomeFoodController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopAdsCell.reuseIdentifier, for: indexPath) as? HomeTopAdsCell {
            
            cell.configureWithModels(viewModel.topHomeAd)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
