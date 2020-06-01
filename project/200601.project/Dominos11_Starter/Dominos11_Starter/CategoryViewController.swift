//
//  CategoryViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
  let tableView = UITableView()
  let mainTitleName = "Domino's"
  let mainHeaderImage = UIImage(named: "logo")
  let mainHeaderImageView = UIImageView()
  
  let margin = 10
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  private func setupView() {
    view.addSubview(tableView)
    
    navigationItem.title = mainTitleName
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(CustomCell.self, forCellReuseIdentifier: "CellID")
    mainHeaderImageView.image = mainHeaderImage
    tableView.tableHeaderView = mainHeaderImageView
    
    mainHeaderImageView.frame = CGRect (
      x: tableView.safeAreaInsets.left,
      y: tableView.safeAreaInsets.top,
      width: tableView.frame.width,
      height: tableView.frame.height / 3)
    mainHeaderImageView.image = mainHeaderImage
    tableView.tableHeaderView = mainHeaderImageView
    
    tableView.rowHeight = 100
  }
}

extension CategoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! CustomCell
    cell.categoryCellImageView.image = UIImage(named: DataImages[indexPath.row])
    return cell
  }
}
extension CategoryViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let productVC = ProductViewController()
    let nextTitle = DataImages[indexPath.row]
    productVC.title = nextTitle
    productVC.view.backgroundColor = .systemBackground
    navigationController?.pushViewController(productVC, animated: true)
  }
}
