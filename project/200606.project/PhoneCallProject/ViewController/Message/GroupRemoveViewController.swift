//
//  GroupRemoveViewController.swift
//  PhoneCallProject
//
//  Created by 이진욱 on 2020/06/06.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class GroupRemoveViewController: UIViewController {
    //MARK: - 프로퍼티 생성
    let removeTableView = UITableView()
    var removeCell = MessageCell()
    var groupNameCheck = ""
    var groupindexCheck = 0

    override func viewDidLoad() {
      super.viewDidLoad()
      title = "그룹 삭제"
      setupTableView()
      setupRightBarButton()
      
    }
  //MARK: - 레이아웃 생성
  // 뷰 생성
  func setupTableView() {
    removeTableView.frame = view.frame
    removeTableView.dataSource = self
    removeTableView.delegate = self
    removeTableView.rowHeight = 75
    removeTableView.register(MessageCell.self, forCellReuseIdentifier: "remove")
    view.addSubview(removeTableView)
  }
  // 바 버튼 생성
  func setupRightBarButton() {
    let deleteBarButton = UIBarButtonItem (title: "삭제", style: .plain, target: self, action: #selector(actionBarButton))
    navigationItem.rightBarButtonItem = deleteBarButton
  }
  //MARK: - 기능 생성
  
  // 바 버튼 액션
  @objc func actionBarButton(_ sender: UIBarButtonItem) {
    // 삭제 바 버튼 누를 시 2차 확인
    let removeCheckAlert = UIAlertController (title: "알림", message: "그룹명 : \(groupNameCheck)\n삭제하시겠습니까 ?", preferredStyle: .alert)
    let removeCheckAlertOk = UIAlertAction (title: "네", style: .default) { _ in
      MessageData.groupList.remove(at: self.groupindexCheck)
      MessageData.frontGroup.remove(at: self.groupindexCheck + 1)
      MessageData.messageUserList.removeValue(forKey: self.groupNameCheck)
      self.navigationController?.popViewController(animated: true)
    }
    let removeCheckAlertCancle = UIAlertAction (title: "아니오", style: .cancel)
    removeCheckAlert.addAction(removeCheckAlertOk)
    removeCheckAlert.addAction(removeCheckAlertCancle)
    present(removeCheckAlert, animated: true)
  }
}

extension GroupRemoveViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    MessageData.groupList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    removeCell = removeTableView.dequeueReusableCell(withIdentifier: "remove", for: indexPath) as! MessageCell
    removeCell.textLabel?.text = MessageData.groupList[indexPath.row]
    removeCell.imageView?.image = UIImage(systemName: MessageImage.group)
    removeCell.imageView?.tintColor = .black
    return removeCell
    
  }
}
extension GroupRemoveViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    groupNameCheck = MessageData.groupList[indexPath.row]
    groupindexCheck = indexPath.row
  }
}
