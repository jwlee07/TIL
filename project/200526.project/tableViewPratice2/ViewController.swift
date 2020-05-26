//
//  ViewController.swift
//  tableViewPratice2
//
//  Created by 이진욱 on 2020/05/26.
//  Copyright © 2020 jwlee. All rights reserved.


import UIKit

class ViewController: UIViewController {
  
  let tableView = UITableView()
  var tableViewCell = CustomCell()
  var data = Array(1...50)

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    
    setupTableView()

  }
  func setupTableView() {
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(CustomCell.self, forCellReuseIdentifier: "Custom")
    view.addSubview(tableView)
  }
  @objc func actionButton(_ sender: UIButton) {
    let buttonTag = sender.tag
    let indexpathCheck = IndexPath(row: buttonTag, section: 0)
    if let tableViewCell = tableView.cellForRow(at: indexpathCheck) {
    let resNumber = data[buttonTag] + 1
    data[buttonTag] = resNumber
    tableViewCell.textLabel?.text = "\(resNumber)"
    }
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as! CustomCell
    if tableViewCell.textLabel?.text == nil {
      tableViewCell.addButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)}
    tableViewCell.addButton.tag = indexPath.row
    tableViewCell.textLabel?.text = "\(data[indexPath.row])"
    return tableViewCell
  }
}



