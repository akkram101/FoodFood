//
//  HomeFoodController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/27/23.
//

import UIKit

class HomeFoodController: HomeBaseViewController {
    
    var viewModel = HomeFoodViewModel()
    
    private func requestData() {
        viewModel.requestTopHomeAd {[weak self] (isSuccess, ads) in
            guard let self = self else { return }
            
            
        }
        
        viewModel.requestNearestRestaurants {[weak self] isSuccess, models in
            guard let self = self else { return }
        }
        
        viewModel.requestPopularMenu {[weak self] isSuccess, models in
            guard let self = self else { return }
            
        }
        
        homeTableView.reloadData()
    }
    
    private func setupUI() {
        searchView.delegate = self
        
        view.addSubview(homeTableView)
        homeTableView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(adapt(20))
            make.left.equalToSuperview().offset(adapt(20))
            make.right.equalToSuperview().offset(adapt(-20))
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
        tableView.register(NearRestoCollectionCell.self, forCellReuseIdentifier: NearRestoCollectionCell.reuseIdentifier)
        tableView.register(PopularItemsCollectionCell.self, forCellReuseIdentifier: PopularItemsCollectionCell.reuseIdentifier)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
}

extension HomeFoodController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.row < viewModel.homeTableCellHeights.count else { return 0 }
        if indexPath.row == 1 && viewModel.nearestRestaurants.count == 0 { return 0 }
        
        let rowHeight = viewModel.homeTableCellHeights[indexPath.row]
        return adapt(rowHeight)
    }
    
}

extension HomeFoodController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopAdsCell.reuseIdentifier, for: indexPath) as? HomeTopAdsCell {
                
                cell.configureWithModels(viewModel.topHomeAd)
                
                return cell
            }
        } else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NearRestoCollectionCell.reuseIdentifier, for: indexPath) as? NearRestoCollectionCell else {
                return UITableViewCell()
                
            }
                cell.setupUI()
                cell.restaurantModels = viewModel.nearestRestaurants
                return cell
        } else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularItemsCollectionCell.reuseIdentifier, for: indexPath) as? PopularItemsCollectionCell, viewModel.nearestRestaurants.count > 0 else {
                return UITableViewCell()
                
            }
                cell.setupUI()
                cell.foodModels = viewModel.popularMenu
                return cell
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopAdsCell.reuseIdentifier, for: indexPath) as? HomeTopAdsCell {
                
                cell.configureWithModels(viewModel.topHomeAd)
                
                return cell
            }
        }
        
        return UITableViewCell()
    }
}
