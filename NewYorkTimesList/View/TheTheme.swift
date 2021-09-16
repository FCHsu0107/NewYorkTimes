//
//  TheTheme.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/16.
//

import UIKit

enum FontType {
    
    case pageTitle
    
    case button
    
    case title
    
    case paragraph
    
    case secondary
    
    case tertiary
    
    var size: CGFloat {
        
        switch self {
        
        case .pageTitle: return 34
            
        case .button, .title: return 18
        
        case .paragraph: return 17
            
        case .secondary: return 15
            
        case .tertiary: return 13
        }
    }
    
    var weight: UIFont.Weight {
        switch self {
        
        case .pageTitle: return .bold
            
        case .button, .title, .paragraph: return .regular
            
        case .secondary: return .regular
            
        case .tertiary: return .regular
        }
    }
}

class TT {
    
    // Inset
    
    static var sideInset: CGFloat = 12
    
    static var verticalInset: CGFloat = 8
    
    // Color
    
    static let shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.2)
    
    static let badgeBGColor = UIColor(red: 238 / 255, green: 189 / 255, blue: 65 / 255, alpha: 1.0)
    
    static let cellBgColor = UIColor(red: 240 / 255, green: 240 / 255, blue: 240 / 255, alpha: 1.0)
    
    // Corner Radius
    
    static let badgeCornerRadius: CGFloat = 6
    
    static let cardCornerRadius: CGFloat = 5
    
    static func font(_ type: FontType) -> UIFont {
        
        UIFont.systemFont(ofSize: type.size, weight: type.weight)
    }
}
