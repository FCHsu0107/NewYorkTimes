//
//  ListBookCell.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/14.
//

import UIKit

class ListBookCell: UITableViewCell {
    
    var cardView: ShadowView = {
        
        let view = ShadowView()
        
        return view
    }()
    
    var titleLabel: UILabel = {
        
       let label = UILabel()
        
        label.font = TT.font(.title)
        
        label.text = "titleLabel"
        
        return label
    }()
    
    var authorLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = TT.font(.secondary)
        
        label.text = "authorLabel"
        
        return label
    }()
    
    var descriptionLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = TT.font(.paragraph)
        
        label.numberOfLines = 0
        
        label.text = "descriptionLabel descriptionLabel descriptionLabel descriptionLabel descriptionLabel descriptionLabel descriptionLabel descriptionLabel descriptionLabel descriptionLabel"
        
        return label
    }()
    
    var priceLabel: BadgeLabel = {
        
        let label = BadgeLabel()
        
        label.font = TT.font(.secondary)
        
        label.text = " L 15.0  "
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setUpUI() {
        
        contentView.backgroundColor = TT.cellBgColor
        
        contentView.addSubview(cardView)
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: TT.verticalInset),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -TT.verticalInset),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: TT.sideInset),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -TT.sideInset)
        ])
        
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: TT.verticalInset),
            titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: TT.sideInset),
            titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -TT.sideInset)
        ])
        
        contentView.addSubview(authorLabel)
        
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: TT.verticalInset / 2),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
        
        contentView.addSubview(descriptionLabel)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: TT.verticalInset / 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
        
        contentView.addSubview(priceLabel)
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: TT.verticalInset / 2),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -(TT.verticalInset) * 2)
        ])
    }
}
