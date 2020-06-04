//
//  UserInfoViewController.swift
//  PhoneCallProject
//
//  Created by 이진욱 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    override func viewDidLoad() {
      super.viewDidLoad()
      setupView()
      createListView()
    }
  func setupView() {
    view.backgroundColor = .systemBackground
    title = "그룹 리스트"
  }
  func createListView() {
    guard MessageData.group.count != 2 else {return}
    for _ in 0...MessageData.group.count - 3 {
      let check = MessageData.messageUserList[MessageData.group[1]]
      let index = UIView()
      index.frame = CGRect (x: view.safeAreaInsets.left + 20, y: (view.safeAreaInsets.top + 100) + (100 * MessageData.CGcount), width: view.frame.width - (MessageData.padding * 2), height: view.frame.height / 3)
      index.backgroundColor = .systemIndigo
      index.layer.cornerRadius = 15
      index.clipsToBounds = true
      
      MessageData.gropuLabel.text = "그룹명 : \(MessageData.group[1])"
      MessageData.gropuLabel.textColor = .black
      MessageData.gropuLabel.frame = CGRect (x: 10, y: 0, width: index.frame.width, height: 30)
      
      for index in check! {
        var listLabel = "\(index)\n"
        MessageData.nameLabel.text = "목록 : "
        MessageData.nameLabel.text?.append(contentsOf: listLabel)
        print (MessageData.nameLabel.text)
      }
      MessageData.nameLabel.textColor = .black
      MessageData.nameLabel.frame = CGRect (x: 10, y: 30, width: index.frame.width, height: 30)
      
      view.addSubview(index)
      index.addSubview(MessageData.gropuLabel)
      index.addSubview(MessageData.nameLabel)
      index.addSubview(MessageData.numberuLabel)
      
      MessageData.CGcount += 1
      MessageData.count += 1
    }
  }
}

