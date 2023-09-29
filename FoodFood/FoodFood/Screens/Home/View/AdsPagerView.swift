//
//  AdsPagerView.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import Foundation
import UIKit
import FSPagerView

//TODO: - Refactor TYCycle
class AdsPagerView: UIView {
    
    var adModels = [HomeTopAdModel]()
    
    static let reuseIdentifer = "FSPagerReuseIdentifier"
    
    private func setupUI() {
        addSubview(pagerView)
        pagerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
//        addSubview(pageControl)
//        pageControl.snp.makeConstraints { make in
//            make.bottom.equalToSuperview()
//            make.centerX.equalToSuperview()
//            make.height.equalTo(adapt(20))
//            make.width.equalTo(adapt(100))
//        }
    }
    
    convenience init(ads: [HomeTopAdModel] ) {
        self.init(frame: .zero)
        self.adModels = ads
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    lazy var pagerView: FSPagerView = {
        let pagerView = FSPagerView(frame: bounds)
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: Self.reuseIdentifer)
        pagerView.backgroundColor = .clear
        
        return pagerView
    }()
    
    private lazy var pageControl: FSPageControl = {
        let pageControl = FSPageControl(frame: .zero)
        pageControl.numberOfPages = adModels.count
        pageControl.currentPage = 0
        
        pageControl.contentHorizontalAlignment = .center
        
        pageControl.setStrokeColor(.white, for: .normal)
        pageControl.setStrokeColor(.white, for: .selected)
        
        pageControl.setFillColor(.clear, for: .normal)
        pageControl.setFillColor(.white, for: .selected)
        
        return pageControl
    }()
}

extension AdsPagerView: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return adModels.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: Self.reuseIdentifer, at: index)
        
        let model = adModels[index]
        cell.contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0,
                                                             left: adapt(4),
                                                             bottom: 0,
                                                             right: adapt(4)))
        }
        cell.contentView.layer.shadowOpacity = 0
        cell.layer.shadowOpacity = 0
        
        cell.imageView?.image = KImage(model.adImageURL)
    
        return cell
    }
    
}

extension AdsPagerView: FSPagerViewDelegate {
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        pageControl.currentPage = index
        print("Swiped ad to index:\(index)")
    }
}

