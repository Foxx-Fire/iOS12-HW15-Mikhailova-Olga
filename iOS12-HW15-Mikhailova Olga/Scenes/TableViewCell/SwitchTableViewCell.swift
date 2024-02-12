//
//  SwitchTableViewCell.swift
//  iOS12-HW15-Mikhailova Olga
//
//  Created by mbpro2.0/16/512 on 12.02.2024.
//

import UIKit

class SwitchTableViewCell: StandartTableViewCell {
    
    override class var identifier: String { "SwitchTableViewCell" }
    
    fileprivate enum Constants {
        static let smallOffset: CGFloat = 6
    }
    
    // MARK: - Outlets
    
    lazy var mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.setOn(true, animated: true)
        mySwitch.addTarget(self, action: #selector(switchOnOff), for: .valueChanged)
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
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
        addSubview(mySwitch)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mySwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            mySwitch.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.smallOffset),
            mySwitch.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.smallOffset)
        ])
    }
    
    // MARK: Actions
    
    @objc
    func switchOnOff() { }
}

