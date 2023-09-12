//
//  FilterCollectionCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import UIKit
import SnapKit

protocol FilterCollectionCellDelegate: AnyObject {
    func filterCell(_ filterCell: FilterCollectionCell, didAddFilter filter: FilterCriterion)
    func filterCell(_ filterCell: FilterCollectionCell, didRemoveFilter filter: FilterCriterion)
}

class FilterCollectionCell: UICollectionViewCell {
    
    weak var delegate: FilterCollectionCellDelegate?
    
    var isOn = false
    
    
    static let reuseIdentifier = "FilterCollectionCellReuseIdentifier"
    static let minWidth: CGFloat = 74
    
    //Restaurant is placeholder
    var model: FilterCriterion = FilterType.restaurant {
        didSet {
            titleLabel.text = model.title
        }
    }
    
    @objc private func updateUI(_ tap: UITapGestureRecognizer) {
        if isOn {
            unselectFilter()
            self.delegate?.filterCell(self, didRemoveFilter: model)
        } else {
            selectFilter()
            self.delegate?.filterCell(self, didAddFilter: model)
        }
        
        isOn = !isOn
    }
        
    class func getActualWidth(withText text: String) -> CGFloat {
        let buttonTitle = text
        let offset: CGFloat = 20.0
        
        let button = UIButton(type: .system)
        button.titleLabel?.font = .scaleMedium(size: 12)
        button.setTitle(buttonTitle, for: .normal)
        button.sizeToFit()
        let actualWidth = button.intrinsicContentSize.width + 2 * offset
        
        return actualWidth
    }
        
    private func setupUI() {
        contentView.addSubview(container)
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalTo(container)
        }
    }
    
    func selectFilter() {
        UIView.animate(withDuration: 0.5) {
            self.titleLabel.textColor = .Orange.subColor
            self.container.backgroundColor = .Orange.mainColor
        }
    }
    
    func unselectFilter() {
        UIView.animate(withDuration: 0.5) {
            self.titleLabel.textColor = .Orange.mainColor
            self.container.backgroundColor = .Orange.subColor
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .scaleMedium(size: 12)
        label.textColor = .Orange.mainColor
        
        return label
    }()
    
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .Orange.subColor
        view.layer.cornerRadius = adapt(15)
        let tap = UITapGestureRecognizer(target: self, action: #selector(updateUI(_:)))
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("Messageeee")
    }
    
}
