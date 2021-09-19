//
//  UIViewController+Ext.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/17.
//

import UIKit

extension UIViewController {
    
    func popAlert(title: String, message: String, actions: [UIAlertAction]) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        actions.forEach { alert.addAction($0) }
        
        present(alert, animated: true, completion: nil)
    }
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var sceneDelegate: SceneDelegate? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate as? SceneDelegate else { return nil }
        return delegate
    }
    
    var window: UIWindow? {
        
        if #available(iOS 13, *) {
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let delegate = windowScene.delegate as? SceneDelegate, let window = delegate.window else { return nil }
            
            return window
        }
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate, let window = delegate.window else { return nil }
        
        return window
    }
}

