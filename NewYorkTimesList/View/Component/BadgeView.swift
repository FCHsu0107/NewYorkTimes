//
//  BadgeView.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/16.
//

import UIKit

class BadgeView: UIView {

    let label: UILabel = UILabel()
    
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
        
        label.textAlignment = .center
        
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -2),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
    }
}
