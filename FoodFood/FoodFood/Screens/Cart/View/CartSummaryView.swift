//
//  CartSummaryView.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/3/23.
//

import Foundation
import SnapKit

class CartSummaryView: UIView {
    
    func configure(withItems models: [CartItemModel]) {
        var itemsTotal:CGFloat = 0
        models.forEach { element in
            itemsTotal += element.item.itemPrice * CGFloat(element.quantity)
        }
        let itemsTotalString = String(format: "%0.2f $", itemsTotal)
        let deliveryChargesString = models.count > 0 ? "10.00 $" : "0.00 $"
        let discount = "0.00 $"
        itemsTotalView.setRightText(itemsTotalString)
        deliveryFeeView.setRightText(deliveryChargesString)
        discountView.setRightText(discount)
        
        let delviveryFee = models.count > 0 ? 10.0 : 0.0
        let totalStr = itemsTotal + delviveryFee
        let totalOrderStr = String(format: "%0.2f $", totalStr)
        
        totalView.setRightText(totalOrderStr)
    }
    
    private func setupUI() {
        backgroundColor = UIColor.init(hex: "#00ec84")
        
        addSubview(backgroundImgV)
        backgroundImgV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(itemsTotalView)
        itemsTotalView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(adapt(20))
            make.left.equalToSuperview().offset(adapt(30))
            make.right.equalToSuperview().offset(adapt(-23))
            make.height.equalTo(adapt(15))
        }
        addSubview(deliveryFeeView)
        deliveryFeeView.snp.makeConstraints { make in
            make.top.equalTo(itemsTotalView.snp.bottom).offset(adapt(7))
            make.left.equalTo(itemsTotalView)
            make.right.equalTo(itemsTotalView)
            make.height.equalTo(adapt(15))
        }
        
        addSubview(discountView)
        discountView.snp.makeConstraints { make in
            make.top.equalTo(deliveryFeeView.snp.bottom).offset(adapt(7))
            make.left.equalTo(itemsTotalView)
            make.right.equalTo(itemsTotalView)
            make.height.equalTo(adapt(15))
        }
        
        addSubview(totalView)
        totalView.snp.makeConstraints { make in
            make.top.equalTo(discountView.snp.bottom).offset(adapt(21))
            make.left.equalTo(itemsTotalView)
            make.right.equalTo(itemsTotalView)
            make.height.equalTo(adapt(20))
        }
        
        addSubview(placeOrderBtn)
        placeOrderBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(adapt(-12))
            make.left.equalToSuperview().offset(adapt(12))
            make.right.equalToSuperview().offset(adapt(-12))
            make.height.equalTo(adapt(57))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
    private lazy var backgroundImgV: UIImageView = UIImageView(imageName: "summary_bg")
    private lazy var itemsTotalView: PairLabelView = PairLabelView(leftText: "Sub-Total", rightText: "0.00 $")
    private lazy var deliveryFeeView: PairLabelView = PairLabelView(leftText: "Delivery Charge", rightText: "0.00 $")
    private lazy var discountView: PairLabelView = PairLabelView(leftText: "Discount", rightText: "0.00 $")
    
    private lazy var totalView: PairLabelView = {
        let view = PairLabelView(leftText: "Total", rightText: "0 $")
        view.setRightTextFont(.scaleBold(size: 18))
        view.setLeftTextFont(.scaleBold(size: 18))
        
        
        return view
    }()
    
    private lazy var placeOrderBtn: UIButton = {
       let btn = UIButton()
        btn.layer.cornerRadius = adapt(15)
        btn.setTitle("Place My Order", for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(.systemGreen, for: .normal)
        btn.titleLabel?.font = .scaleBold(size: 12)
        
        return btn
    }()
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
}
