//
//  SearchView.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import UIKit
import IQKeyboardManager

protocol SearchViewDelegate: AnyObject {
    func searchView(_ searchView: SearchView, didInputText searchText: String, withTextField textField: UITextField)
    func searchView(_ searchView: SearchView, didClickFilterBtn button: UIButton)
}

class SearchView: UIView {
    
    weak var delegate: SearchViewDelegate?
    
    @objc private func filterBtnAction(_ btn: UIButton) {
        self.delegate?.searchView(self, didClickFilterBtn: btn)
    }
    
    private func addKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillHide() {
        animateToMinWidth()
    }
    
    static let animationDuration: CGFloat = 0.3
    
    func animateToMaxWidth() {
        
        UIView.animate(withDuration: Self.animationDuration) {
            self.searchField.frame.size.width = Self.maxSearchWidth
//            self.searchField.snp.updateConstraints { make in
//                make.width.equalTo(Self.maxSearchWidth)
//            }
            self.filterBtn.alpha = 0
        }
    }
    
    func animateToMinWidth() {
        
        UIView.animate(withDuration: Self.animationDuration) {
            self.searchField.frame.size.width = Self.minSearchWidth
//            self.searchField.snp.updateConstraints { make in
//                make.width.equalTo(Self.maxSearchWidth)
//            }
            self.filterBtn.alpha = 1
        }
    }
    
    static let minSearchWidth: CGFloat = adapt(267)
    static let maxSearchWidth: CGFloat = adapt(325)
    static let searchHeight: CGFloat = adapt(50)
    
    private func setupUI() {
        addSubview(searchField)
//        searchField.snp.makeConstraints { make in
//            make.top.bottom.left.equalToSuperview()
//            make.width.equalTo(Self.minSearchWidth)
//        }
        
        searchField.frame = CGRect(x: 0, y: 0, width: Self.minSearchWidth, height: Self.searchHeight)
        addSubview(filterBtn)
        filterBtn.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalTo(adapt(50))
            
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    lazy var searchField: UITextField = {
        let searchF = UITextField.init()
        searchF.backgroundColor = UIColor.init(hex: "F9A84D", alpha: 0.3)
        searchF.layer.cornerRadius = 20
        searchF.font = .scaleRegular(size: 13)
        searchF.autocorrectionType = .no
        searchF.autocapitalizationType = .none
        searchF.spellCheckingType = .no
        searchF.tintColor = UIColor.init(hex: "F9A84D")
        searchF.placeholder = "What do you want to order?"
        searchF.textColor = UIColor.init(hex: "F9A84D")
        
        let leftImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: adapt(20), height: adapt(20)))
        leftImgView.image = KImage("icon_search")
        leftImgView.contentMode = .scaleAspectFit
        
        let spacing: CGFloat = adapt(10)
        let leftViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: leftImgView.frame.width + 2 * spacing, height: leftImgView.frame.height))
        leftViewContainer.addSubview(leftImgView)
        leftImgView.frame.origin.x = spacing
        
        searchF.leftView = leftViewContainer
        searchF.leftViewMode = .always
        searchF.delegate = self
        
        return searchF
    }()
    
    lazy var filterBtn: UIButton = {
       let btn = UIButton()
        btn.setImage(KImage("icon_filter"), for: .normal)
        btn.addTarget(self, action: #selector(filterBtnAction(_:)), for: .touchUpInside)
        
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = adapt(10)
    
        return btn
    }()
}

extension SearchView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let searchFText = textField.text {
            let newText = searchFText + string
            
            delegate?.searchView(self, didInputText: newText, withTextField: textField)
        }
        
        return true
    }
}
