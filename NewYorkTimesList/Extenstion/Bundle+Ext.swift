//
//  Bundle+Ext.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/14.
//

import Foundation

extension Bundle {
    
    static func valueForString(_ key: String) -> String? {
        
        return Bundle.main.infoDictionary?[key] as? String
    }
}
