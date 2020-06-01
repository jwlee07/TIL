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
  var wishMenuName: [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Wish List"
    setupWishTableView()
  }
  override func viewWillAppear(_ animated: Bool) {
//    listKeys = Array(DataWishListDics.keys)
    for (key, _) in DataWishListDics {
      if !wishMenuName.contains(key) {
        wishMenuName.append(key)
      }
    }
    wishListTableView.reloadData()
  }
  private func setupWishTableView() {
    wishListTableView.frame = view.frame
    wishListTableView.dataSource = self
    wishListTableView.delegate = self
    wishListTableView.rowHeight = 120
    view.addSubview(wishListTableView)
    
    let listDeleteBtn = UIBarButtonItem(title: "목록 지우기", style: .done, target: self, action: #selector(listDeleteBtnAction))
    let oderDeleteBtn = UIBarButtonItem(title: "주문", style: .done, target: self, action: #selector(oderDeleteBtnAction))
    
    navigationItem.leftBarButtonItem = listDeleteBtn
    navigationItem.rightBarButtonItem = oderDeleteBtn
  }
  
  @objc private func listDeleteBtnAction(_ sender: UIBarItem) {
    DataWishListDics.removeAll()
    wishMenuName.removeAll()
    wishListTableView.reloadData()
  }
  
  @objc private func oderDeleteBtnAction(_ sender: UIBarItem) {
    
    let alert = UIAlertController (title: "결제내역", message: totalMenuCount(), preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "결제", style: .default)
    alert.addAction(alertAction)
    present(alert, animated: true)
    
    DataWishListDics.removeAll()
    wishMenuName.removeAll()
    wishListTableView.reloadData()
  }
  func totalMenuCount() -> String {
    var totalMessage = ""
    var totalMoney = 0
    for index in wishMenuName {
      totalMessage += (index + " - " + "\(DataWishListDics[index]!)개\n")
      for (key, value) in Data {
        if let priceCheck = Data[key]!["menu"]?.filter {
          if $0.con
        }
      }
    }
    return totalMessage
  }
}
extension WishListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return wishMenuName.count // 딕셔너리menu 키 갯수
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
    let wishListCell = wishListTableView.dequeueReusableCell(withIdentifier: "Custom") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Custom")
    wishListCell.textLabel?.text = "\(wishMenuName[indexPath.row])"
    wishListCell.imageView?.image = UIImage(named: wishMenuName[indexPath.row])
    guard let checkCount = DataWishListDics[wishMenuName[indexPath.row]] else { return wishListCell }
    wishListCell.detailTextLabel?.text = "주문수량 : " + "\(checkCount)"
    wishListCell.contentView.backgroundColor = .white
    return wishListCell
  }
}
extension WishListViewController: UITableViewDelegate {
  
}
