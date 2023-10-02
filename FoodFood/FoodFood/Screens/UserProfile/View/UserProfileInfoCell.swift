//
//  UserProfileInfoCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/2/23.
//

import UIKit
import SnapKit

class UserProfileInfoCell: UITableViewCell {
    
    static let reuseIdentifier = "UserProfileInfoCellReuseIdentifier"
    
    private func setupUI() {
        selectionStyle = .none
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(adapt(16))
            make.left.equalToSuperview().offset(adapt(8))
            make.width.equalToSuperview().offset(adapt(-100))
        }
    
        contentView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(adapt(4))
            make.left.equalTo(nameLabel)
            make.bottom.equalToSuperview().offset(adapt(-16))
        }
        
        contentView.addSubview(editIconImg)
        editIconImg.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(adapt(-16))
            make.centerY.equalTo(nameLabel)
            make.width.height.equalTo(adapt(24))
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.text = KUserFullName()
        label.font = .scaleBold(size: 27)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
       let label = UILabel()
        label.text = UserManager.shared.userInfo?.email ?? ""
        label.font = .scaleRegular(size: 14)
        label.textColor = UIColor(hex: "#c4c4c4")
        
        return label
    }()
    
    private lazy var editIconImg: UIImageView = {
       let imgV = UIImageView(imageName: "icon_edit")
        
        return imgV
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
