//
//  MainViewController.swift
//  iOS12-HW15-Mikhailova Olga
//
//  Created by mbpro2.0/16/512 on 12.02.2024.
//

import UIKit

class MainViewController: UIViewController {
    var settings = Settings.arrayOfSettings
    var general = General.arrayGeneral
    
    override func loadView() {
        
        let tableView = MainTableView()
        tableView.tableView.delegate = self
        tableView.tableView.dataSource = self
        view = tableView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
    }
}

// MARK: - DataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsOfIphone = settings[indexPath.section][indexPath.row]
        
        switch settingsOfIphone.adds {
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
         settings[section].count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        settings.count
    }
}

// MARK: - Delegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
            var settings = settings[indexPath.section][indexPath.row]
            let viewController = DetailViewController()
            if settings.setting == "Основные" {
                viewController.generalDetail = general
               navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }



