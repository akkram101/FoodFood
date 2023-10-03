//
//  CartItemCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/3/23.
//

import UIKit
import SnapKit

protocol CartItemCellDelegate: AnyObject {
    func cartItem(_ cell: CartItemCell, updatedModel model: CartItemModel)
}

class CartItemCell: UITableViewCell {

    static let reuseIdentifier = "CartItemCellReuseIdentifer"
    
    weak var delegate: CartItemCellDelegate?
    
    var model: CartItemModel = CartItemModel(item: BaseFoodModel(), quantity: 1) {
        didSet {
            configure(withModel: model)
        }
    }
    
    @objc private func addQuantityAction(_ btn: UIButton) {
        model.quantity += 1
        configure(withModel: model)
        self.delegate?.cartItem(self, updatedModel: model)
    }
    
    @objc private func subtractQuantityAction(_ btn: UIButton) {
        guard model.quantity > 1 else { return }
        
        model.quantity -= 1
        configure(withModel: model)
        self.delegate?.cartItem(self, updatedModel: model)
    }
    
    private func configure(withModel model: CartItemModel) {
        imageV.image = KImage(model.item.imageUrl)
        titleLabel.text = model.item.itemShortName
        priceLabel.text = String.init(format: "$%.2f", model.item.itemPrice)
        restaurantLabel.text = model.item.restaurantName
        quantityLabel.text = "\(model.quantity)"
    }
    
    private func setupUI() {
        selectionStyle = .none
        
        contentView.snp.makeConstraints({ make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: adapt(10), bottom: adapt(20), right: adapt(10)))
        })
        
        
        backgroundColor = .clear
        
        contentView.layer.cornerRadius = adapt(20)
        contentView.backgroundColor = .white
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowColor = UIColor.systemGray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        contentView.addSubview(imageV)
        imageV.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(adapt(10))
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
        
        contentView.addSubview(addQuantityBtn)
        addQuantityBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(adapt(-10))
            make.width.height.equalTo(adapt(26))
        }
        
        contentView.addSubview(quantityLabel)
        quantityLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(addQuantityBtn.snp.left)
            make.height.equalTo(addQuantityBtn)
            make.width.equalTo(adapt(40))
        }
        
        contentView.addSubview(subtractQuantityBtn)
        subtractQuantityBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(quantityLabel.snp.left)
            make.width.height.equalTo(adapt(26))
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
    
    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .scaleMedium(size: 16)
        
        return label
    }()
    
    private lazy var addQuantityBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(KImage("icon_add"), for: .normal)
        btn.addTarget(self, action: #selector(addQuantityAction(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var subtractQuantityBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(KImage("icon_minus"), for: .normal)
        btn.addTarget(self, action: #selector(subtractQuantityAction(_:)), for: .touchUpInside)
        
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
