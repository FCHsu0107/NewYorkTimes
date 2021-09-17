//
//  LoginViewController.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/17.
//

import UIKit

class LoginViewController: UIViewController {
    
    typealias ViewModel = LoginPageViewModelInput & LoginPageViewModelOutput
    
    var userNameTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.placeholder = "User name"
        
        textField.borderStyle = .roundedRect

        return textField
        
    }()
    
    var passwordTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.placeholder = "Password"
        
        textField.borderStyle = .roundedRect

        return textField
        
    }()
    
    lazy var loginButton: UIButton = {
        
        let btn = UIButton()
        
        btn.addTarget(self, action: #selector(loginBtnDidClick(_:)), for: .touchUpInside)
        
        btn.setTitle("Log in", for: .normal)
        
        btn.setTitleColor(FontType.button.color, for: .normal)
        
        btn.backgroundColor = TT.badgeBGColor
        
        btn.layer.cornerRadius = TT.badgeCornerRadius
        
        return btn
    }()
    
    var viewModel: ViewModel
    
    init() {
        
        viewModel = LoginPageViewModel()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
        viewModelDataBinding()
    }
    
    private func setUpUI() {
        
        view.backgroundColor = .white
        
        view.addSubview(userNameTextField)
        
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: TT.sideInset),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -TT.sideInset)
        ])
        
        view.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: TT.verticalInset),
            passwordTextField.leadingAnchor.constraint(equalTo: userNameTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: userNameTextField.trailingAnchor)
        ])
        
        view.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: TT.verticalInset),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func loginBtnDidClick(_ sender: UIButton) {
        
        guard let userName = userNameTextField.text, let password = passwordTextField.text else {
            return // TODO pop alert
        }
        
        viewModel.login(userName: userName, password: password)
    }
}

extension LoginViewController {
    
    func viewModelDataBinding() {
        
        viewModel.loginDidSucced = { [weak self] in
            
            self?.switchToBookListPage()
        }
    }
    
    func switchToBookListPage() {
        // TODO
    }
}
