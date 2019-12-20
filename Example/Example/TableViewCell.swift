//
//  TableViewCell.swift
//  Example
//
//  Created by 築山朋紀 on 2019/12/20.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import UIKit

final class TableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 16)
        ])
        
        let imageView = UIImageView(image: .checkmark)
        stackView.addArrangedSubview(imageView)
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        
        let label = UILabel()
        label.text = "username"
        stackView.addArrangedSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
