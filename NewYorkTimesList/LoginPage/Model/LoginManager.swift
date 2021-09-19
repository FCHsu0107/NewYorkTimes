//
//  LoginManager.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/17.
//

import Foundation
import LocalAuthentication

class LoginManager {
    
    static let shared = LoginManager()
    
    private lazy var context = LAContext()
    
    private(set) var status: Bool = false
    
    private init() {}
    
    func login(userName: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        // Check data with server //
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            if userName == "AAA", password == "123" {
                
                self.status = true
                
                completion(Result.success(true))
                
                // Save the token in keychain //
            } else {
                
                let info = [NSLocalizedDescriptionKey: "Wrong user name or password!"]
                let error = NSError(domain: "nytimes.com", code: -100, userInfo: info)
                completion(.failure(error))
            }
        }
    }
    
    func supportBiometrics() -> Bool {
        
        var error: NSError?
        
        let hasTokenInKeyChain: Bool = true // TODO
        
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) && hasTokenInKeyChain
    }
    
    func authenticateWithBiometrics(completion: @escaping (Result<Bool, Error>) -> Void) {
        
        let reason = "Log in by face ID or touch ID"
        
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, authenticationError in
            
            if let error = authenticationError {
                
                return completion(.failure(error))
            }
            
            self?.status = true
            
            completion(.success(success))
        }
    }
}
 
