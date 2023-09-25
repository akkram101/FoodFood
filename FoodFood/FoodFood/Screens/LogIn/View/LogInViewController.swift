//
//  LogInViewController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/4/23.
//

import UIKit

class LogInViewController: BaseViewController {
    
    let viewModel = LoginVM()
    
    @objc private func faceBookBtnAction(_ btn: UIButton) {
        print("login with facebook")
    }
    
    @objc private func googleBtnAction(_ btn: UIButton) {
        print("login with google")
    }

    @objc private func forgotBtnAction(_ btn: UIButton) {
        print("forgot password")
    }
    
    @objc private func loginButtonAction(_ btn: UIButton) {
        guard let email = emailTextF.text,
              let password = passwordTextF.text else { return }
        
        viewModel.login(withEmail: email, password: password) {[weak self] isSuceess in
            guard let self = self else { return }
            
            if isSuceess {
                AppManager.resetRootVCToHomeVC()
            } else {
                print("Filed login")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        view.addSubview(logoImgV)
        logoImgV.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(adapt(47))
            make.width.equalTo(adapt(188))
            make.height.equalTo(adapt(203))
        }
        
        view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImgV.snp.bottom).offset(adapt(50))
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(emailTextF)
        emailTextF.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(adapt(45))
            make.centerX.equalToSuperview()
            make.height.equalTo(adapt(50))
            make.width.equalTo(adapt(330))
        }
        
        view.addSubview(passwordTextF)
        passwordTextF.snp.makeConstraints { make in
            make.top.equalTo(emailTextF.snp.bottom).offset(adapt(20))
            make.centerX.equalToSuperview()
            make.height.equalTo(adapt(50))
            make.width.equalTo(adapt(330))
        }
        
        view.addSubview(continueLabel)
        continueLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextF.snp.bottom).offset(adapt(20))
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(facebookBtn)
        facebookBtn.snp.makeConstraints { make in
            make.top.equalTo(continueLabel.snp.bottom).offset(adapt(30))
            make.left.equalTo(emailTextF.snp.left)
            make.height.equalTo(adapt(50))
            make.width.equalTo(adapt(140))
        }
        
        view.addSubview(googleBtn)
        googleBtn.snp.makeConstraints { make in
            make.top.equalTo(continueLabel.snp.bottom).offset(adapt(30))
            make.right.equalTo(emailTextF.snp.right)
            make.height.equalTo(adapt(50))
            make.width.equalTo(adapt(140))
        }
        
        view.addSubview(forgotBtn)
        forgotBtn.snp.makeConstraints { make in
            make.top.equalTo(googleBtn.snp.bottom).offset(adapt(25))
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotBtn.snp.bottom).offset(adapt(30))
            make.centerX.equalToSuperview()
            make.height.equalTo(adapt(55))
            make.width.equalTo(adapt(140))
        }
    }
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login To Your Account"
        label.font = .scaleBold(size: 20)
        
        return label
    }()
    
    
    private lazy var emailTextF : BaseTextField = {
        let textF = BaseTextField(type: .email, placeholder: "Email", leftImage: "signup_email")
        textF.changeAction = { (newText, isAdd) in
            print("XD")
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
        textF.endEditingAction = {
            print("end editiong")
        }
        return textF
    }()
    
    private lazy var continueLabel: UILabel = {
        let label = UILabel()
        label.text = "Or Continue With"
        label.font = .scaleBold(size: 11)
        
        return label
    }()
    
    private lazy var facebookBtn: UIButton = {
        let btn = UIButton.init(type: .system)
        btn.setTitle("Facebook", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = .scaleBold(size: 12)
//        btn.setImage(UIImage.init(named: ""), for: .normal)
        
        btn.backgroundColor = .white
       
        btn.clipsToBounds = true
        btn.layer.cornerRadius = adapt(10)
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.layer.borderWidth = 0.1
        
        
        btn.layer.shadowColor = UIColor.gray.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 1)
        btn.layer.shadowOpacity = 0.1
    
        btn.addTarget(self, action: #selector(faceBookBtnAction(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var googleBtn: UIButton = {
       let btn = UIButton.init(type: .system)
        btn.setTitle("Google", for: .normal)
        btn.titleLabel?.font = .scaleBold(size: 12)
        btn.setTitleColor(UIColor.black, for: .normal)
//        btn.setImage(UIImage.init(named: ""), for: .normal)
        
        btn.backgroundColor = .white
        btn.clipsToBounds = true
        btn.layer.cornerRadius = adapt(10)
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.layer.borderWidth = 0.1
        
        btn.layer.shadowColor = UIColor.gray.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 1)
        btn.layer.shadowOpacity = 0.1
        
        btn.addTarget(self, action: #selector(googleBtnAction(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var forgotBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
         btn.setTitle("Forgot Your Password?", for: .normal)
         btn.titleLabel?.font = .scaleMedium(size: 11)
         btn.setTitleColor(.systemGreen, for: .normal)
         btn.addTarget(self, action: #selector(forgotBtnAction(_:)), for: .touchUpInside)
        
         return btn
    }()
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton.init(type: .custom)
         btn.setTitle("Login", for: .normal)
         btn.titleLabel?.font = .scaleBold(size: 12)
         btn.setTitleColor(.white, for: .normal)
         btn.backgroundColor  = .systemGreen
        
         btn.clipsToBounds = true
         btn.layer.cornerRadius = adapt(15)
         
         btn.addTarget(self, action: #selector(loginButtonAction(_:)), for: .touchUpInside)
        
         return btn
    }()
    
    lazy var logoImgV : UIImageView = {
        let imgV = UIImageView.init(imageName: "Logo")
        return imgV
    }()
}
