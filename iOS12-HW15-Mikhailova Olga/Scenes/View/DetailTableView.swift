//
//  DetailTableView.swift
//  iOS12-HW15-Mikhailova Olga
//
//  Created by mbpro2.0/16/512 on 12.02.2024.
//

import UIKit

class DetailTableView: UIView {
    
    private var general = General.arrayGeneral

    // MARK: - Outlets
    
    internal lazy var tableView: UITableView  = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
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
