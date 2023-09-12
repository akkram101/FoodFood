//
//  FilterSearchVC.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import UIKit

protocol FilterSearchViewControllerDelegate: AnyObject {
    func filterSearch(_ filterSearchViewController: FilterSearchVC, didSearch filterModel: FilterModel)
}

class FilterSearchVC: HomeBaseViewController {
    
    weak var delegate: FilterSearchViewControllerDelegate?
    
    let vm = FilterSearchVM()
    
    @objc private func searchBtnAction(_ : UIButton) {
        delegate?.filterSearch(self, didSearch: vm.model)
        print("You search with \(vm.model.selectedCriteria.count) filters \n")
        print("done")
        navigationController?.popViewController(animated: true)
    }
    
    
    private func setupUI() {
        view.addSubview(searchField)
        searchField.snp.makeConstraints { make in
            make.top.equalTo(findFoodLabel.snp.bottom).offset(adapt(20))
            make.left.equalTo(findFoodLabel)
            make.height.equalTo(adapt(50))
            make.width.equalTo(adapt(SearchFoodField.maxSearchWidth))
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchField.snp.bottom)
            make.left.equalToSuperview().offset(adapt(25))
            make.right.equalToSuperview().offset(adapt(-25))
            make.bottom.equalToSuperview().offset(adapt(-ABLength.kSafeBottom - 25))
        }
        
        view.addSubview(searchBtn)
        searchBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(adapt(-ABLength.kSafeBottom))
            make.left.right.equalTo(tableView)
            make.height.equalTo(adapt(50))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.delegate = self
        vm.requestAvailableData()
        setupUI()
    }
    
    private lazy var searchField: SearchFoodField = {
        let searchF = SearchFoodField()
        searchF.changeAction = { newText, isAdd in
            guard !newText.isBlank else {
                self.vm.resetData()
                self.tableView.reloadData()
                return
            }
            
            self.vm.requestData(withText: newText)
            self.tableView.reloadData()
        }
        
        return searchF
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FiltersCollection.self, forCellReuseIdentifier: FiltersCollection.reuseIdentiier)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        return tableView
    }()
    
    private lazy var searchBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
         btn.setTitle("Search", for: .normal)
         btn.titleLabel?.font = .scaleBold(size: 16)
         btn.setTitleColor(.white, for: .normal)
         btn.backgroundColor  = .systemGreen
        
         btn.clipsToBounds = true
         btn.layer.cornerRadius = adapt(15)
         
         btn.addTarget(self, action: #selector(searchBtnAction(_:)), for: .touchUpInside)
        
         return btn
    }()
    
    func calculateRowHeight(with data: [FilterCriterion], withWidth width: CGFloat) -> CGFloat {
        var currentW: CGFloat = 0
        var adjustedH: CGFloat = 50
        for datum in data {
            let datumW = FilterCollectionCell.getActualWidth(withText: datum.title)
            if datumW > FilterCollectionCell.minWidth {
                currentW += datumW + 10
            } else {
                currentW += FilterCollectionCell.minWidth + 10
            }
            
            if currentW > width {
                adjustedH += 88 + 20
                currentW = 0
            }
        }
        
        return adjustedH
    }
    

}
