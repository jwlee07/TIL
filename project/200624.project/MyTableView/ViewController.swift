//
//  ViewController.swift
//  MyTableView
//
//  Created by 김동현 on 2020/06/24.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  
  let data: [[String: Any]] = [
    ["브랜드": "현대", "차종": ["아반떼", "펠리세이드", "싼타페", "그랜저", "투싼", "쏘나타"]],
    ["브랜드": "기아", "차종": ["쏘렌토", "k5", "셀토스", "카니발", "k3", "k9", "모하비"],],
    ["브랜드": "쌍용", "차종": ["티볼리", "코란도", "렉스턴"],],
    ["브랜드": "삼성", "차종": ["XM3", "QM6", "SM6", "SM3", "SM5", "SM&"],],
    ["브랜드": "벤츠", "차종": ["E클레스", "CLS클래스", "S클래스", "C클래스"],],
    ["브랜드": "BMW", "차종": ["X5", "5시리즈", "X4", "3시리즈", "X6", "X6 그란투리스모"]]
  ]
  
  var cachedOffset = [Int:CGPoint]()
  private let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraint()
  }
}

// MARK: UI

extension ViewController {
  private func setUI() {
    view.backgroundColor = .systemBackground
    view.addSubview(tableView)
    
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
    
  }
  
  private struct Standard {
    static let space: CGFloat = 8
  }
  
  private func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: guide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
      tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor)
    ])
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell else { fatalError("디버깅 할때 여기 메세지 남겨도 됨")}
    cell.congigure(data: data[indexPath.row])
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let cell = cell as? MyTableViewCell else { return }
    cell.offset = cachedOffset[indexPath.row] ?? .zero
  }
  
  func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let cell = cell as? MyTableViewCell else { return }
    cachedOffset[indexPath.row] = cell.offset
  }
}
