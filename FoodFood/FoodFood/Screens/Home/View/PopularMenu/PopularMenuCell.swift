//
//  PopularMenuCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/17/23.
//

import UIKit

class PopularMenuCell: UITableViewCell {
    
    static let reuseIdentifier = "PopularMenuCellReuseIdentifier"
    
    func configure(withModel model: FoodModel) {
        imageV.image = KImage(model.imageUrl)
        titleLabel.text = model.itemName
        priceLabel.text = "$\(model.itemPrice)"
        restaurantLabel.text = model.restaurantName
    }
    
    private func setupUI() {
        clipsToBounds = true
        layer.cornerRadius = adapt(20)
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(imageV)
        imageV.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(adapt(10))
            make.centerY.equalToSuperview()
            make.width.height.equalTo(adapt(64))
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(adapt(-10))
            make.left.equalTo(imageV.snp.right).offset(adapt(10))
        }
        
        addSubview(restaurantLabel)
        restaurantLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(adapt(10))
            make.left.equalTo(imageV.snp.right).offset(adapt(10))
        }
        
        
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(adapt(-20))
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    private lazy var imageV: UIImageView = {
       let imgV = UIImageView()
        imgV.contentMode = .scaleAspectFit
        imgV.layer.cornerRadius = adapt(20)
        
        return imgV
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .scaleBold(size: 16)
        
        return label
    }()
    
    private lazy var restaurantLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .scaleRegular(size: 13)
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .scaleBold(size: 20)
        label.textColor = .init(hex: "FEAD1D")
        
        return label
    }()
}
