//
//  SignUpViewController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/12/23.
//

import Foundation
import UIKit

class SignUpViewController: BaseViewController {
    
    let viewModel = SignUpVM()
    
    @objc private func signUpBtnAction(_ btn: UIButton) {
        guard let username = usernameTextF.text,
              let email = emailTextF.text,
              let password = passwordTextF.text else { return }
        
        viewModel.signUpUser(username: username, email: email, password: password) {[weak self] isSuccess in
            guard let self = self else { return }
            if isSuccess {
                print("Created Account successfully")
                
                self.navigationController?.popViewController(animated: true)
            } else {
                print("Failed to create account")
            }
        }
    }
    
    @objc private func rememberBtnAction(_ btn: UIButton) {
        print(btn.isSelected)
        btn.isSelected = !btn.isSelected
    }
    
    @objc private func emailMeBtnAction(_ btn: UIButton) {
        btn.isSelected = !btn.isSelected
    }
    
    @objc private func alreadyHaveAccBtnAction(_ btn: UIButton) {
        let vc = LogInViewController()
        vc.isShowCustomNav = true

        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    static var textFHeight: CGFloat = adapt(50)
    static var textFSpacing: CGFloat = adapt(15)
    
    private func setupUI() {
        view.addSubview(logoImgV)
        logoImgV.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(adapt(47))
            make.width.equalTo(adapt(188))
            make.height.equalTo(adapt(203))
        }
        
        view.addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImgV.snp.bottom).offset(adapt(60))
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(usernameTextF)
        usernameTextF.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(adapt(45))
            make.centerX.equalToSuperview()
            make.height.equalTo(Self.textFHeight)
            make.width.equalTo(adapt(330))
        }
        
        
        view.addSubview(emailTextF)
        emailTextF.snp.makeConstraints { make in
            make.top.equalTo(usernameTextF.snp.bottom).offset(Self.textFSpacing)
            make.centerX.equalToSuperview()
            make.height.equalTo(Self.textFHeight)
            make.width.equalTo(adapt(330))
        }
        
        view.addSubview(passwordTextF)
        passwordTextF.snp.makeConstraints { make in
            make.top.equalTo(emailTextF.snp.bottom).offset(Self.textFSpacing)
            make.centerX.equalToSuperview()
            make.height.equalTo(Self.textFHeight)
            make.width.equalTo(adapt(330))
        }
        
        view.addSubview(rememberMeBtn)
        rememberMeBtn.snp.makeConstraints { make in
            make.top.equalTo(passwordTextF.snp.bottom).offset(adapt(25))
            make.left.equalTo(passwordTextF.snp.left)
            make.width.equalTo(adapt(200))
        }
        
        view.addSubview(emailMeBtn)
        emailMeBtn.snp.makeConstraints { make in
            make.top.equalTo(rememberMeBtn.snp.bottom).offset(Self.textFSpacing)
            make.left.equalTo(passwordTextF.snp.left)
            make.width.equalTo(adapt(200))
        }
        
        view.addSubview(signUpBtn)
        signUpBtn.snp.makeConstraints { make in
            make.top.equalTo(emailMeBtn.snp.bottom).offset(adapt(40))
            make.centerX.equalToSuperview()
            make.height.equalTo(adapt(55))
            make.width.equalTo(adapt(170))
        }
        
        view.addSubview(alreadyHaveAccBtn)
        alreadyHaveAccBtn.snp.makeConstraints { make in
            make.top.equalTo(signUpBtn.snp.bottom).offset(adapt(20))
            make.centerX.equalToSuperview()
        }
    }
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up For Free"
        label.font = .scaleBold(size: 20)
        
        return label
    }()
    
    private lazy var usernameTextF : BaseTextField = {
        let textF = BaseTextField(type: .username, placeholder: "Username", leftImage: "signup_username")
        textF.changeAction = { (newText, isAdd) in
            print("XD")
        }
        
        return textF
    }()
    
    private lazy var emailTextF : BaseTextField = {
        let textF = BaseTextField(type: .email, placeholder: "Email", leftImage: "signup_email")
        textF.changeAction = {[weak self] (newText, isAdd) in
            guard let self = self,
                  let emailString = self.emailTextF.text else { return }
            let isValid = self.viewModel.checkEmailValidity(email: newText)
            
            if isValid {
                print("isValid")
            } else {
                print("is not valid")
            }
        }
        
            
        return textF
    }()
    
    private lazy var passwordTextF : BaseTextField = {
        let textF = BaseTextField(type: .password, placeholder: "Password", leftImage: "signup_password", rightImage: "signup_eye") {[weak self] isSelected in
            guard let self = self else { return }
            if isSelected {
                self.passwordTextF.isSecureTextEntry = false
            } else {
                self.passwordTextF.isSecureTextEntry = true
            }
        }
        
        return textF
    }()
    
    private lazy var signUpBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
         btn.setTitle("Create Account", for: .normal)
         btn.titleLabel?.font = .scaleBold(size: 16)
         btn.setTitleColor(.white, for: .normal)
         btn.backgroundColor  = .systemGreen
        
         btn.clipsToBounds = true
         btn.layer.cornerRadius = adapt(15)
         
         btn.addTarget(self, action: #selector(signUpBtnAction(_:)), for: .touchUpInside)
        
         return btn
    }()
    
    private lazy var logoImgV : UIImageView = {
        let imgV = UIImageView.init(imageName: "Logo")
        return imgV
    }()
    
  
    
    private lazy var rememberMeBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Keep Me Signed In", for: .normal)
        btn.setTitleColor(.gray, for: .normal)
        btn.titleLabel?.font = .scaleMedium(size: 11)
        btn.backgroundColor = .clear
        
        btn.setImage(KImage("checkOff"), for: .normal)
        btn.setImage(KImage("checkOn"), for: .selected)
        
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: adapt(-90), bottom: 0, right: 0)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: adapt(-80), bottom: 0, right: 0)
        
        btn.addTarget(self, action: #selector(rememberBtnAction(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var emailMeBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Email Me About Special Pricing", for: .normal)
        btn.setTitleColor(.gray, for: .normal)
        btn.titleLabel?.font = .scaleMedium(size: 11)
        
        btn.backgroundColor = .clear
        
        btn.setImage(KImage("checkOff"), for: .normal)
        btn.setImage(KImage("checkOn"), for: .selected)
        
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: adapt(-23), bottom: 0, right: 0)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: adapt(-13), bottom: 0, right: 0)
       
        btn.addTarget(self, action: #selector(emailMeBtnAction(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var alreadyHaveAccBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("already have an account?", for: .normal)
        btn.setTitleColor(.systemGreen, for: .normal)
        btn.titleLabel?.font = .scaleMedium(size: 12)
        btn.backgroundColor = .clear
        
        btn.addTarget(self, action: #selector(alreadyHaveAccBtnAction(_:)), for: .touchUpInside)
        
        return btn
    }()
}
