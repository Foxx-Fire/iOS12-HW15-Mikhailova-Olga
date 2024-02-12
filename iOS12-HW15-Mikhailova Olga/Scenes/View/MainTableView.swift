//
//  MainTableView.swift
//  iOS12-HW15-Mikhailova Olga
//
//  Created by mbpro2.0/16/512 on 12.02.2024.
//

import UIKit

 class MainTableView: UIView {
     
     private var setting = Settings.arrayOfSettings
    

    // MARK: - Outlets
    
     internal lazy var tableView: UITableView  = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(StandartTableViewCell.self, forCellReuseIdentifier: StandartTableViewCell.identifier )
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier )
        tableView.register(NumberTableViewCell.self, forCellReuseIdentifier: NumberTableViewCell.identifier)
        tableView.register(WordTableViewCell.self, forCellReuseIdentifier: WordTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Initial

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }    
      
    // MARK: - Setups
    
    private func setupHierarchy() {
        addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
