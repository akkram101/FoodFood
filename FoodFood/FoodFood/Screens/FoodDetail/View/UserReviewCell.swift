//
//  UserReviewCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/28/23.
//

import UIKit
import SnapKit

class UserReviewCell: UITableViewCell {
    
    static let cellHeight:CGFloat = adapt(100)
    
    static let reuseIdentifier = "UserReviewCellReuseIdentifier"
    
    func updateCell(review: String) {
        reviewLbl.attributedText = stringToReviewAttributes(review)
    }
    
    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(userAvatar)
        userAvatar.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.width.height.equalTo(adapt(75))
        }
        
        contentView.addSubview(nameLbl)
        nameLbl.snp.makeConstraints { make in
            make.top.equalTo(userAvatar)
            make.left.equalTo(userAvatar.snp.right).offset(adapt(21))
        }
        
        contentView.addSubview(dateLbl)
        dateLbl.snp.makeConstraints { make in
            make.top.equalTo(nameLbl.snp.bottom)
            make.left.equalTo(nameLbl)
        }
        
        contentView.addSubview(ratingContainer)
        ratingContainer.snp.makeConstraints { make in
            make.top.equalTo(userAvatar)
            make.right.equalToSuperview()
            make.width.equalTo(adapt(53))
            make.height.equalTo(adapt(33))
        }
        
        ratingContainer.addSubview(ratingStarImg)
        ratingStarImg.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(adapt(10))
            make.centerY.equalToSuperview()
            make.height.width.equalTo(adapt(16))
        }
        
        ratingContainer.addSubview(ratingLbl)
        ratingLbl.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(adapt(-10))
            make.centerY.equalToSuperview()
        }
        
        contentView.addSubview(reviewLbl)
        reviewLbl.snp.makeConstraints { make in
            make.left.equalTo(nameLbl)
            make.right.equalTo(ratingContainer)
            make.bottom.equalTo(userAvatar)
        }
        
        updateCell(review: "This Is great, So delicious! You Must Here, With Your family This Is great, So delicious! You Must Here, With Your family")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private lazy var userAvatar: UIImageView = {
       let imgV = UIImageView(imageName: "lebron")
        imgV.layer.cornerRadius = adapt(10)
        imgV.contentMode = .scaleAspectFill
        
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let alpha = CGFloat.random(in: 0.5...1.0)
        
        imgV.backgroundColor = UIColor.init(red: red,
                                            green: green,
                                            blue: blue,
                                            alpha: alpha)
        
        return imgV
    }()
    
    private lazy var nameLbl: UILabel = {
        let label = UILabel()
        label.text = "Lebron James"
        label.font = .scaleBold(size: 15)
        
        return label
    }()
    
    private lazy var dateLbl: UILabel = {
        let label = UILabel()
        label.font = .scaleRegular(size: 12)
        label.text = "12 April 2023"
        label.textColor = UIColor.init(hex: "#3B3B3B")
        return label
    }()
    
    private lazy var reviewLbl: UILabel = {
        let label = UILabel()
        label.font = .scaleRegular(size: 12)
        label.textColor = UIColor.init(hex: "#3B3B3B")
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var ratingContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#e6fbf2")
        view.layer.cornerRadius = adapt(18)
        return view
    }()
    private lazy var ratingStarImg: UIImageView = UIImageView(imageName: "icon_star")
    private lazy var ratingLbl: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.font = .scaleBold(size: 16)
        label.textColor = UIColor.init(hex: "#00e580")
        return label
    }()
    
    
    
    
    private func stringToReviewAttributes(_ review: String) -> NSMutableAttributedString {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.3
        
        let attributedText = NSMutableAttributedString(string: review, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        
        return attributedText
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implmented")
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
