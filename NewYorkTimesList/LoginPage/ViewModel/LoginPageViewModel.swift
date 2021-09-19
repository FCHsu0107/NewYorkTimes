//
//  LoginPageViewModel.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/17.
//

import Foundation

public protocol LoginPageViewModelInput {
    
    func checkStatus() -> Bool
    
    func supportBiometrics() -> Bool
    
    func login(userName: String, password: String)
    
    func loginWithBiometrics()
}

public protocol LoginPageViewModelOutput {
    
    var loginDidSucced: (() -> Void)? { get set }
    
    var errorDidRevice: ((_ message: String) -> Void)? { get set }
}

public final class LoginPageViewModel: LoginPageViewModelOutput {
    
    public var loginDidSucced: (() -> Void)?
    
    public var errorDidRevice: ((_ message: String) -> Void)?
    
    private let manager: LoginManager
    
    init(manager: LoginManager = LoginManager.shared) {
        
        self.manager = manager
    }
}

extension LoginPageViewModel: LoginPageViewModelInput {
    public func checkStatus() -> Bool {
        
        return false
    }
    
    public func supportBiometrics() -> Bool {
        
        manager.supportBiometrics()
    }
    
    public func login(userName: String, password: String) {
        
        manager.login(userName: userName, password: password) { [weak self] result in
            
            self?.loginResultDidRevice(result: result)
        }
    }
    
    public func loginWithBiometrics() {
        
        manager.authenticateWithBiometrics { [weak self] result in
            
            self?.loginResultDidRevice(result: result)
        }
    }
    
    private func loginResultDidRevice(result: Result<Bool, Error>) {
        
        switch result {
        case .failure(let error):
            self.errorDidRevice?(error.localizedDescription)
            
        case .success(let sucess):
            if sucess {
                
                self.loginDidSucced?()
            } else {
                
                self.errorDidRevice?("Something went wrong!")
            }
        }
    }
}
