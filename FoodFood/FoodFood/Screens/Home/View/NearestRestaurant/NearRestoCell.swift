//
//  NearRestoCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import UIKit

class NearRestoCell: UICollectionViewCell {
    
    static let reuseIdentifier = "NearRestoCellReuseIdentifier"
    static let cellHeight: CGFloat = 140
    
    func configure(withModel model: BaseRestaurantModel) {
        imageV.image = KImage(model.imageURL)
        titleLabel.text = model.shortName
        distancetLabel.text = "\(model.distance) mins"
    }
    
    private func setupUI() {
        clipsToBounds = true
        layer.cornerRadius = adapt(20)
        backgroundColor = .white
        
        addSubview(imageV)
        imageV.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(adapt(20))
            make.centerX.equalToSuperview()
            make.width.height.equalTo(adapt(80))
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageV.snp.bottom).offset(adapt(10))
            make.centerX.equalToSuperview()
        }
        
        addSubview(distancetLabel)
        distancetLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(adapt(10))
            make.centerX.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    private lazy var imageV: UIImageView = {
       let imgV = UIImageView()
        imgV.contentMode = .scaleAspectFill
        
        return imgV
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .scaleBold(size: 16)
        
        return label
    }()
    
    private lazy var distancetLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .scaleRegular(size: 14)
        label.textColor = .systemGray
        
        return label
    }()
}
