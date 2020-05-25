//
//  TableViewNumbers.swift
//  TableViewPractice
//
//  Created by giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewNumbers: UIViewController {
  
  /***************************************************
   1부터 50까지의 숫자 출력하기
   ***************************************************/
  
  override var description: String { "Practice 1 - Numbers" }
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    view.addSubview(tableView)
    
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellDen")
  }
}

extension TableViewNumbers: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 50
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell: UITableViewCell
//    if let cellCheck = tableView.dequeueReusableCell(withIdentifier: "CellDen") {
//      cell = cellCheck
//    } else {
//      cell = UITableViewCell(style: .default, reuseIdentifier: "CellDen")
//    }
//    cell.textLabel?.text = "\(indexPath.row)"
//    return cell
//  }
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellDen", for: indexPath)
    cell.textLabel?.text = "\(indexPath.row)"
    return cell
  }
}
