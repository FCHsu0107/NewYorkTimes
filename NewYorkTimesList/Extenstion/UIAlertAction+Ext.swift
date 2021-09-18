//
//  UIAlertAction+Ext.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/18.
//

import UIKit

extension UIAlertAction {
    
    static func okAction(handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        
        UIAlertAction(title: "OK", style: .default, handler: handler)
    }
}
