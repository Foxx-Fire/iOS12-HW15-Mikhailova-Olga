//
//  WordTableViewCell.swift
//  iOS12-HW15-Mikhailova Olga
//
//  Created by mbpro2.0/16/512 on 12.02.2024.
//

import UIKit

class WordTableViewCell: StandartTableViewCell {
    
    override class var identifier: String { "WordTableViewCell" }
    
    // MARK: - Outlets
    
    lazy var vklLabel: UILabel = {
        let label = UILabel()
        //label.text = "Вкл."
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        addSubview(vklLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            vklLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -37),
            vklLabel.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -20),
            vklLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
