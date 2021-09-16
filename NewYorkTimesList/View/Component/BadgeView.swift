//
//  BadgeView.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/16.
//

import UIKit

class BadgeLabel: UILabel {

    init(bgColor: UIColor = TT.badgeBGColor) {
        super.init(frame: .zero)
        
        backgroundColor = bgColor
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        
        layer.masksToBounds = true
        
        layer.cornerRadius = TT.badgeCornerRadius
        
        textAlignment = .center
    }
}
