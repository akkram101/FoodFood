//
//  HomeFoodController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/27/23.
//

import UIKit

class HomeFoodController: HomeBaseViewController {
    
    var viewModel = HomeFoodViewModel()
    
    @objc private func filterBtnAction(_ btn: UIButton) {
        let vc = PlaceHolderViewController()
        vc.isShowCustomNav = true
        vc.title = "Search"
        
        AppManager.rootViewController()?.pushViewController(vc, animated: true)
    }
    
    @objc private func viewMoreBtnAction(_ btn: UIButton) {
        let vc = HomeBaseViewController()
        vc.modalPresentationStyle = .popover
        
        AppManager.rootViewController()?.present(vc, animated: true)
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
    }
    
    static let minSearchWidth: CGFloat = adapt(267)
    static let maxSearchWidth: CGFloat = adapt(325)
    static let searchHeight: CGFloat = adapt(50)
    
    private func setupUI() {
        view.addSubview(searchField)
        searchField.snp.makeConstraints { make in
            make.top.equalTo(findFoodLabel.snp.bottom).offset(adapt(20))
            make.left.equalTo(findFoodLabel)
            make.height.equalTo(adapt(50))
            make.width.equalTo(adapt(267))
        }
        
        view.addSubview(filterBtn)
        filterBtn.snp.makeConstraints { make in
            make.top.bottom.equalTo(searchField)
            make.right.equalTo(notificationBell).offset(adapt(-10))
            make.width.equalTo(adapt(50))
        }
    
        view.addSubview(homeTableView)
        homeTableView.snp.makeConstraints { make in
            make.top.equalTo(searchField.snp.bottom)
            make.left.equalToSuperview().offset(adapt(20))
            make.right.equalToSuperview().offset(adapt(-20))
            make.height.equalTo(adapt(500))
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
    
    lazy var searchField: UITextField = {
        let searchF = UITextField.init()
        searchF.backgroundColor = UIColor.init(hex: "F9A84D", alpha: 0.3)
        searchF.layer.cornerRadius = 20
        searchF.font = .scaleRegular(size: 13)
        searchF.autocorrectionType = .no
        searchF.autocapitalizationType = .none
        searchF.spellCheckingType = .no
        searchF.tintColor = UIColor.init(hex: "F9A84D")
        searchF.placeholder = "What do you want to order?"
        searchF.textColor = UIColor.init(hex: "F9A84D")
        
        let leftImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: adapt(20), height: adapt(20)))
        leftImgView.image = KImage("icon_search")
        leftImgView.contentMode = .scaleAspectFit
        
        let spacing: CGFloat = adapt(10)
        let leftViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: leftImgView.frame.width + 2 * spacing, height: leftImgView.frame.height))
        leftViewContainer.addSubview(leftImgView)
        leftImgView.frame.origin.x = spacing
        
        searchF.leftView = leftViewContainer
        searchF.leftViewMode = .always
        
        
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
