//
//  String+Ext.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/17.
//

import Foundation

extension String {
    
    func wordCount() -> Int {
        
        guard !self.isEmpty else { return 0 }
        
        let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        
        let components = self.components(separatedBy: chararacterSet)
        
        let words = components.filter { !$0.isEmpty }
        
        return words.count
    }
}
