//
//  BaseTextField.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/12/23.
//

import UIKit

enum TextFieldType {
    case email
    case phoneNum
    case password
    case username
}

class BaseTextField: UITextField {
    
    var type: TextFieldType?
    
    typealias ChangeClosure = (_ isAdd: Bool) -> Void?
    typealias DidEndEditingClosure = () -> Void?
    
    var changeAction: ChangeClosure?
    var endEditingAction: DidEndEditingClosure?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    init(type: TextFieldType? = nil, placeholder: String) {
        self.type = type

        super.init(frame: .zero)
        self.placeholder = placeholder
        delegate = self
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {

        font = .scaleRegular(size: 12)
        tintColor = .gray
        autocorrectionType = .no
        spellCheckingType = .no
        
        //border
        clipsToBounds = true
        layer.cornerRadius = adapt(10)
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 0.1
        
        //shadow
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.1
        
        //left view
        let leftIndentationView = UIView(frame: CGRect(x: 0, y: 0, width: adapt(20), height: frame.height))
        leftView = leftIndentationView
        leftViewMode = .always
        
        if let type = type {
            keyboardType = type == .phoneNum ? .numberPad : .default
            isSecureTextEntry = type == .password ? true : false
        }
    }
}

extension BaseTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        guard let type = type else {
            if let changeAction = changeAction {
                changeAction(true)
            }
            
            return true
        }
        
        switch type {
        case .email:
            print("Email")
            break
        case .password:
            print("Password")
            break
        case .phoneNum:
            print("Phone num")
            break
        case .username:
            print("username")
            break
        }
        
        if let changeAction = changeAction {
            changeAction(true)
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let endEditingAction = endEditingAction else { return }
        
        endEditingAction()
    }
}
