//
//  ChatPersonCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/12/23.
//

import UIKit
import SnapKit

class ChatPersonCell: UITableViewCell {

    static let reuseIdentifier = "ChatPersonCellReuseIdentifer"
    private func setupUI() {
        selectionStyle = .none
        
        contentView.snp.makeConstraints({ make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: adapt(20), right: adapt(10)))
        })
        
        
        backgroundColor = .clear
        
        contentView.layer.cornerRadius = adapt(20)
        contentView.backgroundColor = .white
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowColor = UIColor.systemGray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        contentView.addSubview(personImgV)
        personImgV.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(adapt(16))
            make.width.height.equalTo(adapt(62))
        }
        
        contentView.addSubview(personNameLabel)
        personNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(adapt(20))
            make.left.equalTo(personImgV.snp.right).offset(adapt(12))
        }
        
        contentView.addSubview(messageSnippetLabel)
        messageSnippetLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(adapt(-20))
            make.left.equalTo(personNameLabel)
        }
        
        contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(adapt(20))
            make.right.equalToSuperview().offset(-adapt(12))
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private lazy var personImgV: UIImageView = {
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
    
    private lazy var personNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Lebron James"
        label.font = .scaleBold(size: 15)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var messageSnippetLabel: UILabel = {
       let label = UILabel()
        label.text = "Your Order Just Arrived"
        label.font = .scaleMedium(size: 14)
        label.textColor = .systemGray
        
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
         label.text = "20:00"
         label.font = .scaleMedium(size: 14)
         label.textColor = .systemGray
         
         return label
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
