//
//  CategoryViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
  
  let categoryTableView = UITableView()
  var categoryCell = CustomCell()
  let headerImage = UIImage(named: "logo")
  let headerImageView = UIImageView()
  let productTitle = ["슈퍼시드", "프리미엄", "클래식", "사이드디시", "음료", "피클&소스"  ]
  let productVC = ProductViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCategoryTableView()
    setupHeaderImage()
  }
  
  // MARK : 테이블 뷰 생성
  func setupCategoryTableView() {
    categoryTableView.frame = view.frame
    categoryTableView.dataSource = self
    categoryTableView.delegate = self
    categoryTableView.rowHeight = 100
    categoryTableView.register(CustomCell.self, forCellReuseIdentifier: "Custom")
    view.addSubview(categoryTableView)
  }
  
  // MARK : 헤더 이미지 세팅
  func setupHeaderImage() {
    title = "Domino's"
    headerImageView.frame = CGRect (
      x: view.safeAreaInsets.left,
      y: view.safeAreaInsets.top,
      width: categoryTableView.frame.width,
      height: categoryTableView.frame.height / 3)
    headerImageView.image = headerImage
    categoryTableView.tableHeaderView = headerImageView
  }
}

//MARK : - EXTENSION
extension CategoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    categoryCell.categoryImageArr.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    categoryCell = categoryTableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as! CustomCell
    categoryCell.categoryImageView.image = categoryCell.setupCategoryImage(indexPath.row)
    return categoryCell
  }
}

extension CategoryViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    productVC.title = productTitle[indexPath.row]
    navigationController?.pushViewController(productVC, animated: true)
    productVC.indexCheck = indexPath.row
  }
}

