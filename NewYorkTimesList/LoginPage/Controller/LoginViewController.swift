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
    
    lazy var biometricsView: UIImageView = {
        
        var view = UIImageView()
        
        view.contentMode = .scaleAspectFit
        
        view.image = UIImage(named: "biometrics")
        
        view.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_ :)))
        
        tapGesture = tap
        
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    var tapGesture: UITapGestureRecognizer?
    
    var viewModel: ViewModel
    
    deinit {
        
        if let tap = tapGesture {
            
            biometricsView.removeGestureRecognizer(tap)
        }
    }
    
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
            userNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
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
        
//        guard viewModel.supportBiometrics() else { return }
        
        view.addSubview(biometricsView)
        
        biometricsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            biometricsView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 40),
            biometricsView.leadingAnchor.constraint(equalTo: userNameTextField.leadingAnchor),
            biometricsView.trailingAnchor.constraint(equalTo: userNameTextField.trailingAnchor),
            biometricsView.heightAnchor.constraint(equalTo: biometricsView.widthAnchor, multiplier: 0.67)
        ])
    }
    
    @objc func loginBtnDidClick(_ sender: UIButton) {
        
        guard let userName = userNameTextField.text, let password = passwordTextField.text else {
            return // TODO pop alert
        }
        
        viewModel.login(userName: userName, password: password)
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        
        if viewModel.supportBiometrics() {
            viewModel.loginWithBiometrics()
        } else {
            self.popAlert(
                title: "Biometrics unavailable",
                message: "Your device is not configured for biometric authentication",
                actions: [UIAlertAction.okAction()]
            )
        }
        
        print("JQ loginWithBiometrics ")
        
    }
}

extension LoginViewController {
    
    func viewModelDataBinding() {
        
        viewModel.loginDidSucced = { [weak self] in
            
            self?.switchToBookListPage()
        }
        
        viewModel.errorDidRevice = { [weak self] message in
            
            self?.popAlert(title: "Error", message: message, actions: [UIAlertAction.okAction()])
        }
    }
    
    func switchToBookListPage() {
        // TODO
    }
}
