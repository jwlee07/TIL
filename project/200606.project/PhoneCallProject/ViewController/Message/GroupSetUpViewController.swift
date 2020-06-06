//
//  GroupSetUpViewController.swift
//  PhoneCallProject
//
//  Created by 이진욱 on 2020/06/06.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class GroupSetUpViewController: UIViewController {
  
  //MARK: - 프로퍼티 생성
  
    var setupTableView = UITableView()
    var setupCell = MessageCell()
  
    let setupList = MessageData.groupSetList

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTablewView()
    }
  //MARK: - 테이블 뷰 세팅
  func setupTablewView() {
    setupTableView.frame = view.frame
    setupTableView.delegate = self
    setupTableView.dataSource = self
    setupTableView.rowHeight = 100
    setupTableView.register(MessageCell.self, forCellReuseIdentifier: "setup")
    view.addSubview(setupTableView)
  }
}
  //MARK: - 테이블 셀 세팅
extension GroupSetUpViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    MessageData.groupSetList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    setupCell = setupTableView.dequeueReusableCell(withIdentifier: "setup", for: indexPath) as! MessageCell
    setupCell.textLabel?.text = setupList[indexPath.row]
    setupCell.accessoryType = .disclosureIndicator
    setupCell.tintColor = .black
    switch setupList[indexPath.row] {
    case "그룹 등록":
      setupCell.imageView?.image = UIImage(systemName: MessageImage.groupAdd)
    case "그룹 삭제":
      setupCell.imageView?.image = UIImage(systemName: MessageImage.groupRemove)
    case "그룹 세부정보":
      setupCell.imageView?.image = UIImage(systemName: MessageImage.groupCheckList)
    default:
      break
    }
    return setupCell
  }
}
extension GroupSetUpViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch setupList[indexPath.row] {
    case "그룹 등록":
      let signUpVC = MessageSignUpViewController()
      signUpVC.view.backgroundColor = .systemBackground
      navigationController?.pushViewController(signUpVC, animated: true)
    case "그룹 삭제":
      let removeVC = GroupRemoveViewController()
      removeVC.view.backgroundColor = .systemBackground
      navigationController?.pushViewController(removeVC, animated: true)
    case "그룹 세부정보":
      let detailVC = GroupDetailInfoViewController()
      detailVC.view.backgroundColor = .systemBackground
      navigationController?.pushViewController(detailVC, animated: true)
    default:
      break
    }
  }
}
