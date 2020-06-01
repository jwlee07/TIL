//
//  ProductViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
  
  let productTableView = UITableView()
  var productMenus: [Any] = []
  var productPrice: [Any] = []
  var productTitle = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupProductTableView()
    
  }
  func setupProductTableView() {
    productTableView.frame = view.frame
    productTableView.delegate = self
    productTableView.dataSource = self
    productTableView.rowHeight = 120
    view.addSubview(productTableView)
    productTitle = navigationItem.title!
    productMenus = Data[productTitle]!["menu"]!
    productPrice = Data[productTitle]!["price"]!
  }
  
}
extension ProductViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return productMenus.count
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let productCell = productTableView.dequeueReusableCell(withIdentifier: "Custom") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Custom")
    let productCellForMenu = productMenus[indexPath.row] as! String
    let productCellForPrice = productPrice[0] as! Int
    
    productCell.imageView?.image = UIImage(named: productCellForMenu)
    productCell.textLabel?.text = productCellForMenu
    productCell.detailTextLabel?.text = String(productCellForPrice) + " 원"
    productCell.contentView.backgroundColor = .white
    
    return productCell
  }
}

extension ProductViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailVC = DetailViewController()
    detailVC.title = productMenus[indexPath.row] as? String
    detailVC.view.backgroundColor = .systemBackground
    navigationController?.pushViewController(detailVC, animated: true)
  }
}
