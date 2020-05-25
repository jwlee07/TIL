//
//  TableViewSection.swift
//  TableViewPractice
//
//  Created by giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
  
  /***************************************************
   Data :  x ~ y까지의 숫자 (x, y는 임의의 숫자) (10 ~ 50, 60 ~ 78, 0 ~ 100)
   섹션 타이틀을 10의 숫자 단위로 설정하고 각 섹션의 데이터는 해당 범위 내의 숫자들로 구성
   
   e.g.
   섹션 0 - 0부터 9까지의 숫자
   섹션 1 - 10부터 19까지의 숫자
   ...
   
   let data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
   위 데이터가 주어지면
   섹션 0 - 5, 7
   섹션 1 - 16, 19
   섹션 2 - 22, 29
   ...
   ***************************************************/
  
  override var description: String { "Practice 3 - Section" }
  
  let tableView = UITableView()
  let refreshData = UIRefreshControl()
  
  var data = Array(1...100)
  var numberCategories: [Int: [Int]] = [:]
  var sectionTitles: [Int] = []
  
  var numMin = 0
  var numMax = 10
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpTableView()
    setUpRefresh()
    inPutDic()
    inPutArr()
    navigation()
  }
  
  func setUpRefresh() {
    refreshData.tintColor = .black
    refreshData.attributedTitle = NSAttributedString(string: "Refreshing...")
    refreshData.addTarget(self, action: #selector(reloadData), for: .valueChanged)
  }
  
  func setUpTableView() {
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    tableView.refreshControl = refreshData
    view.addSubview(tableView)
  }
  
  func inPutDic() {
    for index in 0...9 {
      numberCategories.updateValue([index * 10], forKey: index)
    }
    for index in data {
      if 0 <= index, 10 > index {numberCategories[0]?.append(index)}
      else if 10 < index, 20 > index {numberCategories[1]?.append(index)}
      else if 20 < index, 30 > index {numberCategories[2]?.append(index)}
      else if 30 < index, 40 > index {numberCategories[3]?.append(index)}
      else if 40 < index, 50 > index {numberCategories[4]?.append(index)}
      else if 50 < index, 60 > index {numberCategories[5]?.append(index)}
      else if 60 < index, 70 > index {numberCategories[6]?.append(index)}
      else if 70 < index, 80 > index {numberCategories[7]?.append(index)}
      else if 80 < index, 90 > index {numberCategories[8]?.append(index)}
      else if 90 < index, 100 > index {numberCategories[9]?.append(index)}
    }
  }
  
  func inPutArr() {
    sectionTitles = numberCategories.keys.sorted()
  }
  
  func navigation() {
    navigationItem.rightBarButtonItem = UIBarButtonItem (title: "새로고침", style: .plain, target: self, action: #selector(reloadData))
  }
  
  @objc func reloadData() {
    numberCategories.removeAll()
    data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
    inPutDic()
    inPutArr()
    tableView.refreshControl?.endRefreshing()
    tableView.reloadData()
  }
}



// MARK: - UITableViewDataSource
extension TableViewSection: UITableViewDataSource {
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    String(sectionTitles[section])
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    sectionTitles.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberCategories[sectionTitles[section]]!.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
    let numCheck = numberCategories[sectionTitles[indexPath.section]]
    cell.textLabel?.text = "\(numCheck![indexPath.row])"
    return cell
  }
}
