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
    var leftImage: String?
    var rightImage: String?
    var rightItemAction: RightItemAction?
    var isRightSelected: Bool = false
    
    typealias ChangeClosure = (_ newText: String,_ isAdd: Bool) -> Void?
    typealias DidEndEditingClosure = () -> Void?
    typealias RightItemAction = (_ isSelected: Bool) -> Void?
    
    var changeAction: ChangeClosure?
    var endEditingAction: DidEndEditingClosure?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    convenience init(type: TextFieldType?,
         placeholder: String) {
        self.init(type: type,
                  placeholder: placeholder,
                  leftImage: nil,
                  rightImage: nil,
                  rightItemAction: nil)
    }
    
    convenience init(type: TextFieldType?, placeholder: String, leftImage: String) {
        self.init(type: type,
                  placeholder: placeholder,
                  leftImage: leftImage,
                  rightImage: nil,
                  rightItemAction: nil)
    }
    
    init(type: TextFieldType?,
         placeholder: String,
         leftImage: String?,
         rightImage: String?,
         rightItemAction: RightItemAction?
    ) {
        self.type = type
        self.leftImage = leftImage
        self.rightImage = rightImage
        self.rightItemAction = rightItemAction
        
        super.init(frame: .zero)
        self.placeholder = placeholder
        delegate = self
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func rightBtnAction(_ sender: UITapGestureRecognizer) {
        guard let rightItemAction = rightItemAction else { return }
        
        isRightSelected = !isRightSelected
        rightItemAction(isRightSelected)
    }
    
    private func setupUI() {

        font = .scaleRegular(size: 12)
        tintColor = .gray
        autocorrectionType = .no
        spellCheckingType = .no
        backgroundColor = .white
        
        //border
        clipsToBounds = false
        layer.cornerRadius = adapt(10)
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 0.1
        
        //shadow
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: adapt(15))
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4
//        clipsToBounds = false
        
        //left view
        if let leftImage = leftImage {
            addLeftImage(leftImage)
        } else {
            let leftIndentView = UIView(frame: CGRect(x: 0, y: 0, width: adapt(20), height: frame.height))
            leftView = leftIndentView
        }
        
        leftViewMode = .always
        
        if let type = type {
            keyboardType = type == .phoneNum ? .numberPad : .default
            isSecureTextEntry = type == .password ? true : false
        }
        
        if let rightImage = rightImage {
            addRightImage(rightImage)
        }
    }
    
    private func addLeftImage(_ image: String) {
        let leftImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: adapt(20), height: adapt(20)))
        leftImgView.image = KImage(image)
        leftImgView.contentMode = .scaleAspectFit
        
        let spacing: CGFloat = adapt(10)
        let leftViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: leftImgView.frame.width + 2 * spacing, height: leftImgView.frame.height))
        leftViewContainer.addSubview(leftImgView)
        leftImgView.frame.origin.x = spacing
        
        leftView = leftViewContainer
    }
    
    private func addRightImage(_ image: String) {
        let rightImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: adapt(20), height: adapt(20)))
        rightImgView.image = KImage(image)
        rightImgView.contentMode = .scaleAspectFit
        
        let spacing: CGFloat = adapt(10)
        let rigthViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: rightImgView.frame.width + 2 * spacing, height: rightImgView.frame.height))
        rigthViewContainer.addSubview(rightImgView)
        rightImgView.frame.origin.x = spacing
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(rightBtnAction(_:)))
        rigthViewContainer.addGestureRecognizer(tap)
        
        rightView = rigthViewContainer
        rightViewMode = .always
    }
}


extension BaseTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        guard let type = type else { return true }
        
        switch type {
        case .email:
//            print("Email")
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
            if let text = textField.text {
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
