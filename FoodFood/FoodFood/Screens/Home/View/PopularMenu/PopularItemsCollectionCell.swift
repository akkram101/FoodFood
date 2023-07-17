//
//  PopularItemsCollectionCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/17/23.
//

import UIKit

class PopularItemsCollectionCell: UITableViewCell {
    
    var foodModels: [FoodModel] = []
    
    static let reuseIdentifier = "PopularMenuReuseIdentifier"
    
    @objc private func viewMoreBtnAction(_ btn: UIButton) {
        let vc = HomeBaseViewController()
        vc.modalPresentationStyle = .popover
        
        AppManager.topViewController()?.present(vc, animated: true)
    }
    
    func setupUI() {
        selectionStyle = .none
        
        contentView.addSubview(itemsLabel)
        itemsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(adapt(20))
            make.left.equalToSuperview().offset(adapt(10))
        }
        
        contentView.addSubview(viewMoreBtn)
        viewMoreBtn.snp.makeConstraints { make in
            make.centerY.equalTo(itemsLabel)
            make.right.equalToSuperview().offset(adapt(-10))
        }
        
        contentView.addSubview(itemsTableView)
        itemsTableView.snp.makeConstraints { make in
            make.top.equalTo(itemsLabel.snp.bottom).offset(adapt(20))
            make.left.equalTo(itemsLabel)
            make.right.equalTo(viewMoreBtn)
            make.height.equalToSuperview().offset(adapt(-50))
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

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
    
    private lazy var itemsLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular Menu"
        label.font = .scaleBold(size: 13)
        
        return label
    }()
    
    private lazy var viewMoreBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("View More", for: .normal)
        btn.setTitleColor(UIColor.init(hex: "FF7C32"), for: .normal)
        btn.titleLabel?.font = .scaleRegular(size: 12)
        btn.addTarget(self, action: #selector(viewMoreBtnAction(_:)), for: .touchUpInside)
        
        return btn
    }()
    
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

extension PopularItemsCollectionCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularMenuCell.reuseIdentifier, for: indexPath) as? PopularMenuCell else {
            return UITableViewCell()
        }
        
        cell.configure(withModel: foodModels[indexPath.row])
        return cell
    }
}

extension PopularItemsCollectionCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return adapt(87)
    }
}
