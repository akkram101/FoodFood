//
//  SearchFoodField.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import UIKit

class SearchFoodField: UITextField {
    
    static let minSearchWidth: CGFloat = adapt(257)
    static let maxSearchWidth: CGFloat = adapt(325)
    static let searchHeight: CGFloat = adapt(50)
    
    
    typealias ChangeClosure = (_ newText: String,_ isAdd: Bool) -> Void?
    typealias DidEndEditingClosure = () -> Void?
    
    var changeAction: ChangeClosure?
    var endEditingAction: DidEndEditingClosure?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = UIColor.init(hex: "F9A84D", alpha: 0.3)
        layer.cornerRadius = 20
        font = .scaleRegular(size: 13)
        autocorrectionType = .no
        autocapitalizationType = .none
        spellCheckingType = .no
        tintColor = UIColor.init(hex: "F9A84D")
        placeholder = "What do you want to order?"
        textColor = UIColor.init(hex: "F9A84D")
        
        let leftImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: adapt(20), height: adapt(20)))
        leftImgView.image = KImage("icon_search")
        leftImgView.contentMode = .scaleAspectFit
        
        let spacing: CGFloat = adapt(10)
        let leftViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: leftImgView.frame.width + 2 * spacing, height: leftImgView.frame.height))
        leftViewContainer.addSubview(leftImgView)
        leftImgView.frame.origin.x = spacing
        
        leftView = leftViewContainer
        leftViewMode = .always
    }
    
    
}

extension SearchFoodField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let changeAction = changeAction {
            if let text = textField.text {
                
                if string == "" {
                    changeAction("", true)
                    return true
                }
                
                changeAction(text + string ,true)
            }
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let endEditingAction = endEditingAction else { return }
        endEditingAction()
    }
}
