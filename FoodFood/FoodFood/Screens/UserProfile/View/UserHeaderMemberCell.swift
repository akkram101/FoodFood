//
//  UserHeaderMemberCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/2/23.
//

import UIKit
import SnapKit

class UserHeaderMemberCell: UITableViewCell {
    
    static let reuseIdentifier = "UserHeaderMemberCellReuseIdentifier"
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.addSubview(lvlContainer)
        lvlContainer.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.height.equalTo(adapt(35))
            make.width.equalTo(adapt(16 + memberLevelLbl.intrinsicContentSize.width + 16))
        }
        
        lvlContainer.addSubview(memberLevelLbl)
        memberLevelLbl.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func updateLevel(_ level: MemberLevel) {
        switch level {
        case .basic:
            memberLevelLbl.text = "Member Basic"
            memberLevelLbl.textColor = UIColor(hex: "#ad4f12")
            lvlContainer.backgroundColor = UIColor(hex: "#edb99d")
        case .silver:
            memberLevelLbl.text = "Member Silver"
            memberLevelLbl.textColor = UIColor(hex: "#484944")
            lvlContainer.backgroundColor = UIColor(hex: "#c6c7c2")
        case .gold:
            memberLevelLbl.text = "Member Gold"
            memberLevelLbl.textColor = UIColor(hex: "#FEAD1D")
            lvlContainer.backgroundColor = UIColor(hex: "#fff8e6")
        }
    }
    
    private lazy var lvlContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#fff8e6")
        view.layer.cornerRadius = adapt(20)
        
        return view
    }()
    
    private lazy var memberLevelLbl: UILabel = {
       let label = UILabel()
        label.text = "Member Gold"
        label.textColor = UIColor(hex: "#FEAD1D")
        label.font = .scaleBold(size: 12)
        
        return label
    }()
    
    
    
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
}
