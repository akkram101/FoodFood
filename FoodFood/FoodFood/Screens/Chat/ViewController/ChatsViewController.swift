//
//  ChatsViewController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/12/23.
//

import UIKit
import SnapKit

class ChatsViewController: BaseViewController {
    
    private func setupUI() {
        view.addSubview(chatLabel)
        chatLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(adapt(66))
            make.left.equalToSuperview().offset(adapt(26))
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(chatLabel.snp.bottom).offset(adapt(20))
            make.left.equalToSuperview().offset(adapt(16))
            make.right.equalToSuperview().offset(adapt(-16))
            make.bottom.equalToSuperview().offset(-adapt(ABLength.kTabBarHeight + 16))
        }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private lazy var chatLabel: UILabel = {
        let label = UILabel()
        label.text = "Chat"
        label.font = .scaleBold(size: 25)
        
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ChatPersonCell.self, forCellReuseIdentifier: ChatPersonCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        
        return tableView
    }()

}
