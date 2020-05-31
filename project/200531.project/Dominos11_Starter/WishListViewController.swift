//
//  WishListViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
  
  let wishListTableView = UITableView()
  var wishListCell = UITableViewCell (style: .subtitle, reuseIdentifier: "Custom")
  
  var wishImageArr: [UIImage] = []
  var wishTitleArr: [String] = []
  var wishCountArr: [Int] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Wish List"
    
    let listCleanBarButton = UIBarButtonItem (title: "목록지우기", style: .plain, target: self, action: #selector(actionCleanBarButton))
    let orderBarButton = UIBarButtonItem (title: "주문", style: .plain, target: self, action: #selector(actionOrderBarButoon))
    
    navigationItem.leftBarButtonItem = listCleanBarButton
    navigationItem.rightBarButtonItem = orderBarButton
    
    setupTableView()
  }
  func setupTableView() {
    wishListTableView.frame = view.frame
    wishListTableView.dataSource = self
    wishListTableView.delegate = self
    wishListTableView.rowHeight = 100
    wishListTableView.register(CustomCell.self, forCellReuseIdentifier: "Custom")
    view.addSubview(wishListTableView)
  }
    
  @objc func actionCleanBarButton() {
    
  }
  @objc func actionOrderBarButoon() {
    
  }
}
extension WishListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    wishImageArr.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    wishListCell = wishListTableView.dequeueReusableCell(withIdentifier: "Custom") as! CustomCell
    wishListCell.imageView?.image = wishImageArr[indexPath.row]
    wishListCell.textLabel?.text = wishTitleArr[indexPath.row]
    wishListCell.detailTextLabel?.text = "주문수량 : " + String(Int(wishCountArr[indexPath.row]))
    return wishListCell
  }
}
extension WishListViewController: UITableViewDelegate {
  
}
