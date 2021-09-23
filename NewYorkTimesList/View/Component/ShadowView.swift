//
//  ShadowView.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/16.
//

import UIKit

class ShadowView: UIView {

    init(bgColor: UIColor = .white) {
        super.init(frame: .zero)
        
        self.backgroundColor = bgColor
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        
        layer.masksToBounds = false
        
        layer.cornerRadius = TT.cardCornerRadius
        
        layer.shadowColor = TT.shadowColor
        
        layer.shadowOffset = .zero
        
        layer.shadowOpacity = 0.8
    }
}
