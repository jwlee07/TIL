//
//  GroupDetailInfoViewController.swift
//  PhoneCallProject
//
//  Created by 이진욱 on 2020/06/06.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class GroupDetailInfoViewController: UIViewController {
  
  //MARK: - 프로퍼티 생성
  let groupDetailTableView = UITableView()
  var groupDetailCell = MessageCell()

    override func viewDidLoad() {
      super.viewDidLoad()
      title = "그룹 세부정보"
      setupTableView()
      
    }
  //MARK: - 테이블 뷰 세팅
  func setupTableView() {
    groupDetailTableView.frame = view.frame
    groupDetailTableView.dataSource = self
    groupDetailTableView.delegate = self
    groupDetailTableView.rowHeight = 75
    groupDetailTableView.register(MessageCell.self, forCellReuseIdentifier: "Detail")
    view.addSubview(groupDetailTableView)
  }
}
  //MARK: - 테이블 셀 세팅
extension GroupDetailInfoViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return MessageData.groupList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    groupDetailCell = groupDetailTableView.dequeueReusableCell(withIdentifier: "Detail", for: indexPath) as! MessageCell
    groupDetailCell.textLabel?.text = "\(MessageData.groupList[indexPath.row])"
    groupDetailCell.accessoryType = .disclosureIndicator
    groupDetailCell.imageView?.image = UIImage(systemName: MessageImage.group)
    groupDetailCell.imageView?.tintColor = .black
    return groupDetailCell
  }
}

extension GroupDetailInfoViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let userInfoVC = UserInfoViewController()
    userInfoVC.title = MessageData.groupList[indexPath.row]
    userInfoVC.view.backgroundColor = .systemBackground
    navigationController?.pushViewController(userInfoVC, animated: true)
  }
}
