//
//  UserProfileCart.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/2/23.
//

import UIKit
import SnapKit

class UserFavorites: UITableViewCell {
    
    static let reuseIdentifier = "UserProfileCartReuseIdentifier"
    
    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(adapt(8))
            make.right.equalToSuperview().offset(adapt(-8))
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FavoriteItemCell.self, forCellReuseIdentifier: FavoriteItemCell.reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false

        
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
