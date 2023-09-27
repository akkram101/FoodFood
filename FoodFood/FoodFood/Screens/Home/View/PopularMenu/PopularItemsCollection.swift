//
//  PopularItemsCollection.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/17/23.
//

import UIKit

class PopularItemsCollection: UITableViewCell {
    
    var foodModels: [FoodModel] = [] {
        didSet {
            itemsTableView.reloadData()
        }
    }
    
    static let reuseIdentifier = "PopularMenuReuseIdentifier"
    static let rowHeight: CGFloat = 87
    
    func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(itemsTableView)
        itemsTableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(adapt(10))
            make.right.equalToSuperview().offset(adapt(-10))
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
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
        
    private lazy var itemsTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(PopularMenuCell.self, forCellReuseIdentifier: PopularMenuCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        
        return tableView
    }()
}
