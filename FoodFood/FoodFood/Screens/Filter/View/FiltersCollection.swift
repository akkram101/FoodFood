//
//  FiltersCollection.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import UIKit

protocol FiltersCollectionDelegate: AnyObject {
    func filtersCollection(_ filterCollection:FiltersCollection, didSelectFilter filter: FilterCriterion)
    func filtersCollection(_ filterCollection:FiltersCollection, didUnselectFilter filter: FilterCriterion)
}

class FiltersCollection: UITableViewCell {
    weak var delegate: FiltersCollectionDelegate?
    
    static let reuseIdentiier = "FiltersCollectionReuseIdentifier"
    
    var data : [FilterCriterion] = [] {
        didSet { configure(withData: data) }
    }
    
    private func configure(withData data: [FilterCriterion]) {
        for datum in data {
            print("xx--\(datum.title)")
        }
        collectionView.reloadData()
    }
    
    private func setupUI() {
        clipsToBounds = false
        selectionStyle = .none
        
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = adapt(10)
        layout.minimumInteritemSpacing = adapt(10)
        
        let collectV = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectV.delegate = self
        collectV.dataSource = self
        collectV.register(FilterCollectionCell.self, forCellWithReuseIdentifier: FilterCollectionCell.reuseIdentifier)
        collectV.showsHorizontalScrollIndicator = false
        collectV.layer.borderColor = UIColor.clear.cgColor
        collectV.layer.borderWidth = 0
        collectV.isScrollEnabled = false
        
        return collectV
    }()
    
    required init?(coder: NSCoder) {
        fatalError("Init with coder not implementnsededeasd")
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
