//
//  HeaderDetailInfoCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/27/23.
//

import UIKit
import SnapKit

class DetailInfoCell: UITableViewCell {
    
    static let reuseIdentifier = "DetailTitleCellReuseIdentifier"
    
    func updateCell(title: String) {
        titleLbl.text = title
    }
    
    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(adapt(32))
            make.right.equalToSuperview().offset(adapt(-32))
            make.top.equalToSuperview().offset(adapt(8))
        }
        
        contentView.addSubview(locationImgV)
        locationImgV.snp.makeConstraints { make in
            make.left.equalTo(titleLbl)
            make.top.equalTo(titleLbl.snp.bottom).offset(adapt(8))
            make.height.width.equalTo(adapt(20))
            make.bottom.equalToSuperview().offset(adapt(-8))
        }
        contentView.addSubview(locationLbl)
        locationLbl.snp.makeConstraints { make in
            make.left.equalTo(locationImgV.snp.right).offset(adapt(8))
            make.top.bottom.equalTo(locationImgV)
        }
        
        contentView.addSubview(ratingsImgV)
        ratingsImgV.snp.makeConstraints { make in
            make.left.equalTo(locationLbl.snp.right).offset(adapt(16))
            make.top.bottom.equalTo(locationImgV)
            make.height.width.equalTo(adapt(20))
        }
        
        contentView.addSubview(ratingsLbl)
        ratingsLbl.snp.makeConstraints { make in
            make.left.equalTo(ratingsImgV.snp.right).offset(adapt(8))
            make.top.bottom.equalTo(ratingsImgV)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private lazy var titleLbl: UILabel = {
       let label = UILabel()
        label.font = .scaleBold(size: 21)
        label.text = "Rainbow Sandwich Sugarless"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var locationImgV: UIImageView = {
       let imgV = UIImageView()
        imgV.image = UIImage(named: "icon_location_light")
        return imgV
    }()
    
    private lazy var locationLbl: UILabel = {
        let label = UILabel()
        label.text = "19 Km"
        label.textColor = .systemGray
        label.font = .scaleRegular(size: 13)
        return label
    }()
    
    private lazy var ratingsImgV: UIImageView = {
       let imgV = UIImageView()
        imgV.image = UIImage(named: "icon_halfStar")
        
        return imgV
    }()
    
    private lazy var ratingsLbl: UILabel = {
       let label = UILabel()
        label.text = "4.8 Rating"
        label.textColor = .systemGray
        label.font = .scaleRegular(size: 13)
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("Init with coder not implemented")
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
