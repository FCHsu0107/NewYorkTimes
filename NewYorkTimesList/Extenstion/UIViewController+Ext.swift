//
//  UIViewController+Ext.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/17.
//

import UIKit.UIViewController

extension UIViewController {
    
    func popAlert(title: String, message: String, actions: [UIAlertAction]) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        actions.forEach { alert.addAction($0) }
        
        present(alert, animated: true, completion: nil)
    }
}

