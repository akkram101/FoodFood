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
    
    private func setupUI() {
        contentView.addSubview(itemsCollectionView)
        itemsCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
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
}

extension NearRestoCollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: NearRestoCell.reuseIdentifier, for: indexPath) as? NearRestoCell {
            
            cell.configure(withModel: RestaurantModel())
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension NearRestoCollectionCell: UICollectionViewDelegate {
    
}
