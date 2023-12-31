//
//  HomeTopAdsCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import UIKit

class HomeTopAdsCell: UITableViewCell {
    
    static let reuseIdentifier = "HomeTopAdsCellReuseIdentifier"
    static let cellHeight: CGFloat = 150
    
    func configureWithModels(_ models: [HomeTopAdModel]) {
        pagerView.adModels = models
        pagerView.pagerView.reloadData()
    }
    
    private func setupUI() {
        clipsToBounds = true
        layer.cornerRadius = adapt(20)
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(pagerView)
        pagerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(adapt(Self.cellHeight))
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
    
    private lazy var pagerView: AdsPagerView = {
        let pageV = AdsPagerView()
        pageV.backgroundColor = .clear
        pageV.layer.cornerRadius = adapt(20)
        
        return pageV
    }()

}
