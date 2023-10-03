//
//  CartViewController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/3/23.
//

import UIKit
import SnapKit

class CartViewController: BaseViewController {
    
    lazy var viewModel = CartViewModel()
    
    private func setupUI() {
        view.addSubview(cartTitleLabel)
        cartTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(adapt(66))
            make.left.equalToSuperview().offset(adapt(26))
        }
        
        view.addSubview(orderSummaryView)
        orderSummaryView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-ABLength.kTabBarHeight - adapt(44))
            make.left.equalToSuperview().offset(adapt(14))
            make.right.equalToSuperview().offset(adapt(-14))
            make.height.equalTo(adapt(206))
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(cartTitleLabel.snp.bottom).offset(adapt(20))
            make.left.equalToSuperview().offset(adapt(16))
            make.right.equalToSuperview().offset(adapt(-16))
            make.bottom.equalTo(orderSummaryView.snp.top).offset(adapt(-24))
        }
    }
    
    private func requestData() {
        viewModel.requestUserCart(completion: {[weak self] (isSuccess, carItems) in
            guard let self = self else { return }
            if isSuccess {
                self.tableView.reloadData()
                self.orderSummaryView.configure(withItems: carItems)
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        requestData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        requestData()
    }
    
    private lazy var cartTitleLabel: UILabel = {
       let label = UILabel()
        label.text = "Order Details"
        label.font = .scaleBold(size: 25)
        
        
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CartItemCell.self, forCellReuseIdentifier: CartItemCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
//        tableView.bounces = false
        
        return tableView
    }()
    
    lazy var orderSummaryView: CartSummaryView = {
        let view = CartSummaryView()
        view.layer.cornerRadius = adapt(20)
        return view
    }()
}
