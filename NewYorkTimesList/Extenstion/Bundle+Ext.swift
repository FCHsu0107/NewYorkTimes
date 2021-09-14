//
//  Bundle+Ext.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/14.
//

import Foundation

enum APIKeyType: String {
    
    case client = "clientKey"
}

extension Bundle {
    
    static func valueForString(_ key: String) -> String? {
        
        return Bundle.main.infoDictionary?[key] as? String
    }
    
    static func apiKey(_ type: APIKeyType) -> String? {
        
        guard let path = Bundle.main.path(forResource: "keys", ofType: "plist"),
              let keys = NSDictionary(contentsOfFile: path) else { return nil }
        
        return keys[type.rawValue] as? String
    }
}
