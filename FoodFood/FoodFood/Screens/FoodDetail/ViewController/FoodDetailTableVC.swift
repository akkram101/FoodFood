//
//  FoodDetailTableVC.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/27/23.
//

import UIKit
import SnapKit

class FoodDetailTableVC: UIViewController {
    
    let viewModel: FoodDetailViewModel
    
    init(viewModel: FoodDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        requestData()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func requestData() {
        
        viewModel.requestMoreDetails { isSuccess, detail in
            self.tableView.reloadData()
        }
        
        viewModel.requestReviews { isSuccess, reviews in
            print("XD")
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Lazy Load
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = true
        tableView.register(HeaderTagDetailCell.self, forCellReuseIdentifier: HeaderTagDetailCell.reuseIdentifier)
        tableView.register(DetailInfoCell.self, forCellReuseIdentifier: DetailInfoCell.reuseIdentifier)
        tableView.register(ReviewsDetailTable.self, forCellReuseIdentifier: ReviewsDetailTable.reuseIdentifier)
        
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = adapt(30)
        tableView.bouncesZoom = false
        tableView.isScrollEnabled = true
        
        return tableView
    }()
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
