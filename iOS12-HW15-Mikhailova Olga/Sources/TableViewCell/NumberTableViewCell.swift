//
//  NumberTableViewCell.swift
//  iOS12-HW15-Mikhailova Olga
//
//  Created by mbpro2.0/16/512 on 12.02.2024.
//

import UIKit

class NumberTableViewCell: StandartTableViewCell {
    
    override class var identifier: String { "NumberTableViewCell" }
    
    fileprivate enum Constants {
        static var smallOffset: CGFloat = 10
        static var bigOffset: CGFloat = 25
    }
    
    // MARK: - Outlets
    
    private lazy var background: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 13
        label.clipsToBounds = true
        label.backgroundColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var number: UIImageView = {
        let image = UIImage(systemName: "1.circle")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        addSubview(background)
        addSubview(number)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            background.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.smallOffset),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.smallOffset),
            background.heightAnchor.constraint(equalToConstant: Constants.bigOffset),
            background.widthAnchor.constraint(equalToConstant: Constants.bigOffset),
            
            number.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            number.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.smallOffset),
            number.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.smallOffset),
            number.heightAnchor.constraint(equalToConstant: Constants.bigOffset),
            number.widthAnchor.constraint(equalToConstant: Constants.bigOffset)
        ])
    }
}

