//
//  UserVouchersCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/2/23.
//

import UIKit
import SnapKit

class UserVouchersCell: UITableViewCell {
    
    static let reuseIdentifier = "UserVouchersCellReuseIdentifier"
    
    func updateVoucher(count:Int) {
        let suffix = count == 1 ? "Voucher" : "Vouchers"
        voucherLabel.text = "You Have \(count) \(suffix)"
    }
    
    private func setupUI() {
        selectionStyle = .none
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: adapt(4), bottom: adapt(20), right: adapt(4)))
        }
        backgroundColor = .clear
        
        contentView.layer.cornerRadius = adapt(20)
        contentView.backgroundColor = .white
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowColor = UIColor.systemGray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        contentView.addSubview(voucherImg)
        voucherImg.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(adapt(8))
            make.width.equalTo(adapt(46))
            make.height.equalTo(adapt(43))
        }
        
        contentView.addSubview(voucherLabel)
        voucherLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(voucherImg.snp.right).offset(adapt(16))
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private lazy var voucherImg: UIImageView = {
       let imgV = UIImageView(imageName: "icon_voucher")
        
        return imgV
    }()
    
    private lazy var voucherLabel: UILabel = {
       let label = UILabel()
        label.font = .scaleMedium(size: 15)
        
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
