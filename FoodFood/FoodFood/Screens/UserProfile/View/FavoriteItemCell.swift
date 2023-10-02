//
//  UserCartItemCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/2/23.
//

import UIKit
import SnapKit

class FavoriteItemCell: UITableViewCell {
    
    static let reuseIdentifier = "UserCartItemCellReuseIdentifer"
    static let cellHeight: CGFloat = 87
    
    func configure(withModel model: BaseFoodModel) {
        imageV.image = KImage(model.imageUrl)
        titleLabel.text = model.itemShortName
        priceLabel.text = String.init(format: "$%.2f", model.itemPrice)
        restaurantLabel.text = model.restaurantName
    }
    
    @objc private func buyAgainBtn(_ btn: UIButton) {
        print("Buy again clicked")
    }
    
    private func setupUI() {
        clipsToBounds = true
        layer.cornerRadius = adapt(20)
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(imageV)
        imageV.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(adapt(64))
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageV)
            make.left.equalTo(imageV.snp.right).offset(adapt(10))
        }
        
        contentView.addSubview(restaurantLabel)
        restaurantLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(titleLabel)
        }
        
        
        contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(adapt(-12))
            make.left.equalTo(titleLabel)
        }
        
        contentView.addSubview(buyAgainBtn)
        buyAgainBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(adapt(-16))
            make.width.equalTo(adapt(85))
            make.height.equalTo(adapt(30))
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private lazy var imageV: UIImageView = {
       let imgV = UIImageView()
        imgV.contentMode = .scaleAspectFill
        imgV.layer.cornerRadius = adapt(20)
        imgV.clipsToBounds = true
        
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
        label.font = .scaleBold(size: 18)
        label.textColor = .init(hex: "#00d279")
        
        return label
    }()
    
    private lazy var buyAgainBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Buy", for: .normal)
        btn.titleLabel?.font = .scaleBold(size: 12)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemGreen
        btn.clipsToBounds = true
        btn.layer.cornerRadius = adapt(15)
        btn.addTarget(self, action: #selector(buyAgainBtn(_:)), for: .touchUpInside)
        return btn
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
