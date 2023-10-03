//
//  PairLabelView.swift
//  FoodFood
//
//  Created by Akkram Bederi on 10/3/23.
//

import UIKit

class PairLabelView: UIView {
    
    //MARK: - Data
    var title: String {
        get { return leftLabel.text ?? "" }
        set { leftLabel.text = newValue }
    }
    var subText: String {
        get { return rightLabel.text ?? "" }
        set { rightLabel.text = newValue }
    }
    
    
    //MARK: - UI
    
    init(leftText: String, rightText: String? = nil) {
        super.init(frame: .zero)
        
        self.leftLabel.text = leftText
        self.rightLabel.text = rightText ?? ""
        
        setupUI()
    }
    
    func updateText(leftText: String? = nil, rightText: String?) {
        if let leftText = leftText {
            leftLabel.text = leftText
        }
        
        if let rightText = rightText {
            rightLabel.text = rightText
        }
    }
    
    //MARK: - UI
    
    private func setupUI() {
        
        addSubview(leftLabel)
        leftLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        addSubview(rightLabel)
        rightLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        handleOverFlowIfNeeded()
    }
    
    private func handleOverFlowIfNeeded() {
        let maxWidth = self.frame.size.width * 0.6
        if rightLabel.intrinsicContentSize.width > maxWidth {
            
            leftLabel.snp.remakeConstraints { make in
                make.left.equalToSuperview()
                make.top.equalToSuperview()
            }
            
            rightLabel.numberOfLines = 0
            rightLabel.snp.remakeConstraints { make in
                make.right.equalToSuperview()
                make.top.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.6)
            }
        }
    }
    
    private lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .scaleMedium(size: 14)
        
        return label
    }()
    
    private lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .scaleMedium(size: 14)
        label.textAlignment = .right
        
        return label
    }()
    
    
    //MARK: Update UI
    func setLeftText(_ text:String) {
        leftLabel.text = text
    }
    
    func setLeftTextColor(_ color: UIColor) {
        leftLabel.textColor = color
    }
    
    func setLeftTextFont(_ font: UIFont) {
        leftLabel.font = font
    }
    
    func setRightText(_ text:String) {
        rightLabel.text = text
    }
    
    func setRightTextColor(_ color: UIColor) {
        rightLabel.textColor = color
    }
    
    func setRightTextFont(_ font: UIFont) {
        rightLabel.font = font
    }
    
    func setLeftOffset(_ offset: CGFloat) {
        leftLabel.snp.updateConstraints { make in
            make.left.equalToSuperview().offset(adapt(offset))
        }
    }

    func setRightOffset(_ offset: CGFloat) {
        rightLabel.snp.updateConstraints { make in
            make.right.equalToSuperview().offset(-adapt(offset))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
}
