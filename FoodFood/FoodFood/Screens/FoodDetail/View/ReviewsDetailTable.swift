//
//  ReviewsDetailCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/28/23.
//

import UIKit

class ReviewsDetailTable: UITableViewCell {
    
    static let reuseIdentifier = "ReviewsDetailCellReuseIdentifier"
    
    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(adapt(32))
            make.right.equalToSuperview().offset(adapt(-32))
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
        tableView.register(UserReviewCell.self, forCellReuseIdentifier: UserReviewCell.reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false

        
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("not implmented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
