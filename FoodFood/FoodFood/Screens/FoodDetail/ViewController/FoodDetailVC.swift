//
//  FoodDetailVC.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/25/23.
//

import UIKit
import SnapKit

class FoodDetailVC: BaseDetailVC {
    
    let viewModel: FoodDetailViewModel
    
    init(viewModel: FoodDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Button Action
    @objc private func addToCartBtnAction() {
        dismiss(animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init with coder not implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        requestData()
    }
    
    
    
    // MARK: - UI
    
    private func setupUI() {
//        view.addSubview(tableView)
//        tableView.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(adapt(100))
//            make.left.right.bottom.equalToSuperview()
//        }
        
        view.addSubview(addToCartBtn)
        addToCartBtn.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(adapt(16))
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-adapt(16))
            make.height.equalTo(adapt(50))
        }
    }
    
    //MARK: - ViewModel Functions
    
    private func requestData() {
        
        viewModel.requestMoreDetails { isSuccess, detail in
            self.setBackGroundImg(detail.imageName)
            self.tableView.reloadData()
        }
        
        viewModel.requestReviews { isSuccess, reviews in
            print("XD")
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Lazy Load
    
    lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        
        return tableView
    }()
    
    private lazy var addToCartBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Add To Cart", for: .normal)
        btn.titleLabel?.font = .scaleBold(size: 14)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemGreen
        btn.clipsToBounds = true
        btn.layer.cornerRadius = adapt(15)
        btn.addTarget(self, action: #selector(addToCartBtnAction), for: .touchUpInside)
        return btn
    }()
}
