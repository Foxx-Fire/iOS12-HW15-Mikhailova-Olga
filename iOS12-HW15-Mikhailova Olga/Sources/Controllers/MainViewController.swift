//
//  MainViewController.swift
//  iOS12-HW15-Mikhailova Olga
//
//  Created by mbpro2.0/16/512 on 12.02.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    var settings: [[Settings]]?
    var general: [[General]]?
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView  = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(StandartTableViewCell.self, forCellReuseIdentifier: StandartTableViewCell.identifier )
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier )
        tableView.register(NumberTableViewCell.self, forCellReuseIdentifier: NumberTableViewCell.identifier)
        tableView.register(WordTableViewCell.self, forCellReuseIdentifier: WordTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationItem.title = "Настройки"
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - DataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let settingsOfIphone = settings?[indexPath.section][indexPath.row]
        
        switch settingsOfIphone?.adds {
        case .standartType:
            let cell = tableView.dequeueReusableCell(withIdentifier: StandartTableViewCell.identifier, for: indexPath) as? StandartTableViewCell
            guard let cell else { return UITableViewCell() }
            cell.settingsOfIphone = settingsOfIphone
            cell.accessoryType = .disclosureIndicator
            return cell
        case .switchType:
            let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell
            guard let cell else { return UITableViewCell() }
            cell.settingsOfIphone = settingsOfIphone
            cell.mySwitch.tag = indexPath.row
            cell.accessoryView = cell.mySwitch
            cell.mySwitch.isOn.toggle()
            return cell
        case .numberType:
            let cell = tableView.dequeueReusableCell(withIdentifier: NumberTableViewCell.identifier, for: indexPath) as? NumberTableViewCell
            guard let cell else { return UITableViewCell() }
            cell.settingsOfIphone = settingsOfIphone
            cell.accessoryType = .disclosureIndicator
            return cell
        case .wordType:
            let cell = tableView.dequeueReusableCell(withIdentifier: WordTableViewCell.identifier, for: indexPath) as? WordTableViewCell
            guard let cell else { return UITableViewCell() }
            cell.settingsOfIphone = settingsOfIphone
            cell.accessoryType = .disclosureIndicator
            if indexPath.row % 2 == 0 {
                cell.vklLabel.text = "Вкл."
                return cell
            } else {
                cell.vklLabel.text = "Не подключено"
                return cell
            }
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings?[section].count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        settings?.count ?? 0
    }
}

// MARK: - Delegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        tableView.deselectRow(at: indexPath, animated: true)
        var settingsList = settings?[indexPath.section][indexPath.row]
        if settingsList?.setting == "Основные" {
            navigationController?.pushViewController(viewController, animated: true)
        }
  
        let settingsOfIphone = settings?[indexPath.section][indexPath.row]
        print("Нажата ячейка \(indexPath.row) \( settingsOfIphone?.setting ?? "")" )
    }
}
