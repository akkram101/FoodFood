//
//  ChatDetailViewController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/12/23.
//

import UIKit

class ChatDetailViewController: BaseViewController {
    
    private func setupUI() {
        view.addSubview(chatLabel)
        chatLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(ABLength.kNavBarHeight + adapt(66))
            make.left.equalToSuperview().offset(adapt(26))
        }
        
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalTo(chatLabel.snp.bottom).offset(20)
            make.left.equalTo(chatLabel)
            make.right.equalToSuperview().offset(adapt(-26))
            make.height.equalTo(adapt(100))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private lazy var chatLabel: UILabel = {
        let label = UILabel()
        label.text = "Chat"
        label.font = .scaleBold(size: 25)
        
        return label
    }()
    
    private lazy var headerView: ChatDetailHeaderView = {
       let view = ChatDetailHeaderView()
        
        return view
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
