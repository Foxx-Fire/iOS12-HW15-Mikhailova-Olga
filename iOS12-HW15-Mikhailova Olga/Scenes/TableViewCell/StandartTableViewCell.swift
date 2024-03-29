//
//  StandartTableViewCell.swift
//  iOS12-HW15-Mikhailova Olga
//
//  Created by mbpro2.0/16/512 on 12.02.2024.
//

import UIKit

class StandartTableViewCell: UITableViewCell {
    
    class var identifier: String { "StandartTableViewCell" }
    
    fileprivate enum Constants {
        static var smallOffset: CGFloat = 2
        static var middleOffset: CGFloat = 6
        static var bigOffset: CGFloat = 32
    }
    
    var settingsOfIphone: Settings? {
        didSet {
            guard let settingsOfIphone else { return }
            switch settingsOfIphone.image {
            case .systemName:
                    icon.image = UIImage(systemName: settingsOfIphone.icon)
            case .named:
                    icon.image = UIImage(named: settingsOfIphone.icon)?.withRenderingMode(.alwaysTemplate)
                }
          
            setting.text = settingsOfIphone.setting
            
            switch settingsOfIphone.color {
            case .orange:
                background.backgroundColor = .orange
            case .blue:
                background.backgroundColor = .blue
            case .green:
                background.backgroundColor = .green
            case .red:
                background.backgroundColor = .red
            case .gray:
                background.backgroundColor = .gray
            case .purple:
                background.backgroundColor = .purple
            }
        }
    }
    
    // MARK: - Outlets
    
    private lazy var background: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 7
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var icon: UIImageView = {
        
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var setting: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        [background, icon, setting].forEach{addSubview($0)}
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.middleOffset),
            background.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.middleOffset),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.middleOffset),
            background.heightAnchor.constraint(equalToConstant: Constants.bigOffset),
            background.widthAnchor.constraint(equalToConstant: Constants.bigOffset),
            
            icon.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: Constants.smallOffset),
            icon.topAnchor.constraint(equalTo: background.topAnchor, constant: Constants.smallOffset),
            icon.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -Constants.smallOffset),
            icon.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -Constants.smallOffset),
            
            setting.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),
            setting.centerYAnchor.constraint(equalTo: centerYAnchor),
            setting.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
        ])
        
    }
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.settingsOfIphone = nil
    }
}
