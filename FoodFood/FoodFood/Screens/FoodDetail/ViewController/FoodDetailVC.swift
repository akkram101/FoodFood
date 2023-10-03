//
//  FoodDetailVC.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/25/23.
//

import UIKit
import SnapKit

class FoodDetailVC: BaseDetailVC {
    
    let model: BaseFoodModel
    
    init(model: BaseFoodModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        self.setBackGroundImg(model.imageUrl)
    }
    
    // MARK: - Button Action
    @objc private func addToCartBtnAction() {
        dismiss(animated: true) {
            CartManager.addToCart(self.model, quantity: 1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init with coder not implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }
    
    // MARK: - UI
    private func setupUI() { 
        detailContainer.addSubview(foodDetailTableVC.view)
        foodDetailTableVC.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        foodDetailTableVC.didMove(toParent: self)
        
        view.addSubview(addToCartBtn)
        addToCartBtn.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(adapt(16))
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-adapt(16))
            make.height.equalTo(adapt(50))
        }
    }
    
    private lazy var foodDetailTableVC: FoodDetailTableVC = {
        let viewModel = FoodDetailViewModel(productID: model.productID)
        viewModel.baseModel = model
        
        let vc = FoodDetailTableVC(viewModel: viewModel)
        
        return vc
    }()
    
    private lazy var addToCartBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Add To Cart", for: .normal)
        btn.titleLabel?.font = .scaleBold(size: 14)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemGreen
        btn.clipsToBounds = true
        btn.layer.cornerRadius = adapt(15)
        btn.addTarget(self, action: #selector(addToCartBtnAction), for: .touchUpInside)
        return btn
    }()
}
