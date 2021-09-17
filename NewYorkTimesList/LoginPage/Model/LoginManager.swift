//
//  LoginManager.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/17.
//

import Foundation
import LocalAuthentication

class LoginManager {
    
    private lazy var context = LAContext()
    
    func login(userName: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        // Check data with server //
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            if userName == "AAA", password == "123" {
                
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
        
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
    }
    
    func authenticateWithBiometrics(completion: @escaping (Result<Bool, Error>) -> Void) {
        
        let reason = "Log in by face ID or touch ID"
        
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
            
            if let error = authenticationError {
                
                return completion(.failure(error))
            }
            
            completion(.success(success))
        }
    }
}
 
