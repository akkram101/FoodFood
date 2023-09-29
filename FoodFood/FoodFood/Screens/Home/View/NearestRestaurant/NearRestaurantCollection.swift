//
//  NearRestaurantCollection.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import UIKit

class NearRestaurantCollection: UITableViewCell {
    
    var restaurantModels: [BaseRestaurantModel] = [] {
        didSet {
            itemsCollectionView.reloadData()
        }
    }
    
    static let reuseIdentifier = "NearRestoCellReuseIdentifier"
    
    @objc private func viewMoreBtnAction(_ btn: UIButton) {
        let vc = HomeBaseViewController()
        vc.modalPresentationStyle = .popover
        
        AppManager.topViewController()?.present(vc, animated: true)
    }
    
    func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear

        contentView.addSubview(itemsCollectionView)
        itemsCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.top.equalToSuperview().offset(adapt(10))
            make.height.equalTo(adapt(170))
            make.width.equalToSuperview()
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
        collectV.backgroundColor = .clear
        
        return collectV
    }()
}

extension NearRestaurantCollection: UICollectionViewDataSource {
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

extension NearRestaurantCollection: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected restaurant at index: \(indexPath.row)")
        
        let detailVC = FoodDetailVC(model: BaseFoodModel())
        detailVC.modalPresentationStyle = .overFullScreen
        AppManager.rootViewController()?.present(detailVC, animated: true, completion: {
            APIManager.shortSimulate {
                print("XDXD")
            }
        })
    }
    

}
