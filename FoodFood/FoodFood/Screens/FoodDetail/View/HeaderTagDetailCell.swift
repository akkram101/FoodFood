//
//  HeaderTagDetailCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/27/23.
//

import UIKit
import SnapKit

protocol HeaderTagDetailCellDelegate: AnyObject {
    func cellDidClickLocation(_ foodTagCell: HeaderTagDetailCell)
    func cellDidClickFavorite(_ foodTagCell: HeaderTagDetailCell)
}

class HeaderTagDetailCell: UITableViewCell {
    
    static let reuseIdentifier = "HeaderTagDetailCellReuseIdentifier"
    var tagTitles: [String] = [] {
        didSet {
            addTags(tagTitles)
        }
    }
    
    private func addTags(_ tags:[String]) {
        var tagViews: [UIView] = []
        for tag in tags {
            let view = createViewWithTag(tag)
            tagViews.append(view)
        }
        
        setupTagsViews(tagViews)
    }
    
    private func setupTagsViews(_ tagViews: [UIView]) {
        var previousTag = UIView()
        
        for (index, tagView) in tagViews.enumerated() {
            
            //createLabel to get intrinsict contentSize
            let tag = tagTitles[index]
            let label = UILabel()
            label.text = tag
            label.font = .scaleMedium(size: 12)
            
            //Add View
            contentView.addSubview(tagView)
            tagView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.height.equalTo(adapt(34))
                make.width.equalTo(adapt(18 + label.intrinsicContentSize.width + 18))
                
                if index == 0 {
                    make.left.equalToSuperview().offset(adapt(32))
                } else {
                    make.left.equalTo(previousTag.snp.right).offset(adapt(8))
                }
            }
            
            previousTag = tagView
        }
    }
    
    private func createViewWithTag(_ title: String) -> UIView {
        let label = UILabel()
        label.text = title
        label.font = .scaleMedium(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.init(hex: "#00d87c")
        
        let tagContainer = UIView()
        tagContainer.backgroundColor = UIColor.init(hex: "#eafdf3")
        tagContainer.translatesAutoresizingMaskIntoConstraints = false
        tagContainer.layer.cornerRadius = adapt(20)
        
        tagContainer.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        return tagContainer
    }
    weak var delegate: HeaderTagDetailCellDelegate?
    
    @objc private func locationBtnAction(_ btn: UIButton) {
        delegate?.cellDidClickLocation(self)
    }
    
    @objc private func favoriteBtnAction(_ btn: UIButton) {
        delegate?.cellDidClickFavorite(self)
    }

    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(favoriteBtn)
        favoriteBtn.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(adapt(-32))
            make.height.width.equalTo(adapt(35))
        }
        
        contentView.addSubview(locationBtn)
        locationBtn.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.equalTo(favoriteBtn.snp.left).offset(adapt(-8))
            make.height.width.equalTo(adapt(35))
        }
    }
    
    private func setupTags(_ tags:[String]) {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private lazy var locationBtn: UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "icon_location"), for: .normal)
        btn.addTarget(self, action: #selector(locationBtnAction(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var favoriteBtn: UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "icon_favorite"), for: .normal)
        btn.addTarget(self, action: #selector(favoriteBtnAction(_:)), for: .touchUpInside)
        
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
