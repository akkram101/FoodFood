//
//  HomeFoodController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/27/23.
//

import UIKit

protocol HomeFoodControllerDelegate: AnyObject {
    func homeFoodVC(_ viewController: HomeFoodController, didScrollDown isScrollDown: Bool)
}

class HomeFoodController: HomeBaseViewController {
    
    weak var delegate: HomeFoodControllerDelegate?
    
    let viewModel = HomeFoodViewModel()
    
    var lastScrollYPosition: CGFloat = 0
    
    @objc private func filterBtnAction(_ btn: UIButton) {
        let vc = FilterSearchVC()
        vc.isShowCustomNav = true
        vc.delegate = self
        
        AppManager.rootViewController()?.pushViewController(vc, animated: true)
    }
    
    @objc private func viewMoreBtnAction(_ btn: UIButton) {
        let vc = HomeBaseViewController()
        vc.modalPresentationStyle = .popover
        
        self.navigationController?.present(vc, animated: true)
    }
    
    @objc private func refreshData(_ sender:UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.requestData()
            sender.endRefreshing()
        })
    }
    
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
        
        //scroll to TOP when search
        if viewModel.filter != nil {
            let indexPath = IndexPath(row: 0, section: 0)
            homeTableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    private func setupUI() {
        view.addSubview(searchField)
        
        view.addSubview(filterBtn)
        filterBtn.snp.makeConstraints { make in
            make.top.equalTo(findFoodLabel.snp.bottom).offset(adapt(20))
            make.right.equalTo(notificationBell).offset(adapt(-10))
            make.width.equalTo(adapt(50))
            make.height.equalTo(adapt(50))
        }
    
        
        searchField.snp.makeConstraints { make in
            make.top.bottom.equalTo(filterBtn)
            make.left.equalTo(findFoodLabel)
            make.right.equalTo(filterBtn.snp.left).offset(adapt(-16))
            make.width.equalTo(adapt(SearchFoodField.minSearchWidth))
        }
    
        view.addSubview(homeTableView)
        homeTableView.snp.makeConstraints { make in
            make.top.equalTo(searchField.snp.bottom).offset(adapt(16))
            make.left.equalToSuperview().offset(adapt(20))
            make.right.equalToSuperview().offset(adapt(-20))
            make.bottom.equalToSuperview()
        }
    }
    
    func headerView(withTitle title: String) -> UIView {
        
        let itemsLabel: UILabel
        itemsLabel = UILabel()
        itemsLabel.text = title
        itemsLabel.font = .scaleBold(size: 13)

        
        let viewMoreBtn = UIButton()
        viewMoreBtn.setTitle("View More", for: .normal)
        viewMoreBtn.setTitleColor(UIColor.init(hex: "FF7C32"), for: .normal)
        viewMoreBtn.titleLabel?.font = .scaleRegular(size: 12)
        viewMoreBtn.addTarget(self, action: #selector(viewMoreBtnAction(_:)), for: .touchUpInside)
        
        let headerView = UIView()
        headerView.addSubview(itemsLabel)
        headerView.addSubview(viewMoreBtn)
        
        itemsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(adapt(10))
            make.left.equalToSuperview().offset(adapt(10))
        }
        
        viewMoreBtn.snp.makeConstraints { make in
            make.centerY.equalTo(itemsLabel)
            make.right.equalToSuperview().offset(adapt(-10))
        }
    
        headerView.backgroundColor = .white
        return headerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        requestData()
    }
    
    
    lazy var homeTableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTopAdsCell.self, forCellReuseIdentifier: HomeTopAdsCell.reuseIdentifier)
        tableView.register(NearRestaurantCollection.self, forCellReuseIdentifier: NearRestaurantCollection.reuseIdentifier)
        tableView.register(PopularItemsCollection.self, forCellReuseIdentifier: PopularItemsCollection.reuseIdentifier)
        tableView.register(FiltersCollection.self, forCellReuseIdentifier: FiltersCollection.reuseIdentiier)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        
        tableView.addSubview(refreshControl)
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    lazy var homeTableHeight: CGFloat = self.homeTableView.frame.size.height
    
    lazy var searchField: SearchFoodField = {
        let searchF = SearchFoodField()
        return searchF
    }()
    
    lazy var filterBtn: UIButton = {
       let btn = UIButton()
        btn.setImage(KImage("icon_filter"), for: .normal)
        btn.addTarget(self, action: #selector(filterBtnAction(_:)), for: .touchUpInside)
        
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = adapt(10)
    
        return btn
    }()
    
}
