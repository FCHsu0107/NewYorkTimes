//
//  LoginViewController.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/17.
//

import UIKit

class LoginViewController: UIViewController {
    
    typealias ViewModel = LoginPageViewModelInput & LoginPageViewModelOutput
    
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
