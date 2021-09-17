//
//  LoginPageViewModel.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/17.
//

import Foundation

public protocol LoginPageViewModelInput {
    
    func checkStatus() -> Bool
    
    func login(userName: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void)
}

public protocol LoginPageViewModelOutput {
    
    var loginDidSucced: (() -> Void)? { get set }
}

public final class LoginPageViewModel: LoginPageViewModelOutput {
    
    public var loginDidSucced: (() -> Void)?
    
    init() {}
    
}

extension LoginPageViewModel: LoginPageViewModelInput {
    
    public func checkStatus() -> Bool {
        
        return false
    }
    
    public func login(userName: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        // Check data with server //
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            
            guard let self = self else { return }
            
            if userName == "AAA", password == "123" {
                
                completion(Result.success(true))
                self.loginDidSucced?()
            } else {
                
                let info = [NSLocalizedDescriptionKey: "Wrong user name or password!"]
                let error = NSError(domain: "nytimes.com", code: -100, userInfo: info)
                completion(.failure(error))
            }
        }
    }
}
