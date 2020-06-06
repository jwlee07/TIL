//
//  TimeViewController.swift
//  PhoneCallProject
//
//  Created by 천지운 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
    
    // MARK: TableViews
    private lazy var phoneCallTableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .white
        tableView.alpha = 1
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    // MARK: Setup Layout
    private func setupLayout() {
        view.backgroundColor = .lightGray
        
        view.addSubview(phoneCallTableView)
        phoneCallTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            phoneCallTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            phoneCallTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            phoneCallTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            phoneCallTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80)
        ])
    }
    
    // MARK: View Var, Let
    var selectTime: String = ""
}

// MARK: - TableView Delegate, DataSource
extension TimeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppShared.timeTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Default")
        ?? UITableViewCell(style: .default, reuseIdentifier: "Default")
        
        cell.textLabel?.text = "\(AppShared.timeTitles[indexPath.row])"
        
        if selectTime == AppShared.timeTitles[indexPath.row] {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let time = tableView.cellForRow(at: indexPath)?.textLabel?.text {
            AppShared.phoneCallMenu["시각"] = time
            navigationController?.popViewController(animated: true)
        }
    }
}
