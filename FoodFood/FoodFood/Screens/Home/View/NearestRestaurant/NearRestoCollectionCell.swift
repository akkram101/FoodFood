//
//  NearRestoCollectionCell.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import UIKit

class NearRestoCollectionCell: UITableViewCell {
    
    var restaurantModels: [RestaurantModel] = []
    
    static let reuseIdentifier = "NearRestoCellReuseIdentifier"
    
    @objc private func viewMoreBtnAction(_ btn: UIButton) {
        let vc = HomeBaseViewController()
        vc.modalPresentationStyle = .popover
        
        AppManager.topViewController()?.present(vc, animated: true)
    }
    
    func setupUI() {
        selectionStyle = .none
        
        contentView.addSubview(itemsLabel)
        itemsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(adapt(10))
            make.left.equalToSuperview().offset(adapt(10))
        }
        
        contentView.addSubview(viewMoreBtn)
        viewMoreBtn.snp.makeConstraints { make in
            make.centerY.equalTo(itemsLabel)
            make.right.equalToSuperview().offset(adapt(-10))
        }
        
        contentView.addSubview(itemsCollectionView)
        itemsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(itemsLabel.snp.bottom)
            make.left.equalTo(itemsLabel)
            make.height.equalTo(adapt(170))
            make.width.equalToSuperview()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

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
    
    private lazy var itemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize.init(width: adapt(147), height: adapt(184))
        
        let collectV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectV.register(NearRestoCell.self, forCellWithReuseIdentifier: NearRestoCell.reuseIdentifier)
        collectV.delegate = self
        collectV.dataSource = self
        collectV.showsHorizontalScrollIndicator = false
        
        return collectV
    }()
    
    private lazy var itemsLabel: UILabel = {
        let label = UILabel()
        label.text = "Nearest Restaurant"
        label.font = .scaleBold(size: 13)
        
        return label
    }()
    
    private lazy var viewMoreBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("View More", for: .normal)
        btn.setTitleColor(UIColor.init(hex: "FF7C32"), for: .normal)
        btn.titleLabel?.font = .scaleRegular(size: 12)
        btn.addTarget(self, action: #selector(viewMoreBtnAction(_:)), for: .touchUpInside)
        
        return btn
    }()
}

extension NearRestoCollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurantModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: NearRestoCell.reuseIdentifier, for: indexPath) as? NearRestoCell {
            
            cell.configure(withModel: restaurantModels[indexPath.row])
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension NearRestoCollectionCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected restaurant at index: \(indexPath.row)")
    }
}
