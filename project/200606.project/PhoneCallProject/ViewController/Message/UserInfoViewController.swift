//
//  UserInfoViewController.swift
//  PhoneCallProject
//
//  Created by 이진욱 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    //MARK: - 프로퍼티 생성
    let userInfoView = UIView()
    var userInfoLabel = UILabel()
    
    let userList = MessageData.messageUserList
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLabel()
        userInfoTextReload()
    }
  //MARK: - 뷰, 라벨 세팅
  
  // 뷰 세팅
  func setupView() {
    userInfoView.frame = view.frame
    userInfoView.backgroundColor = .systemBackground
    view.addSubview(userInfoView)
  }
  // 라벨 세팅
  func setupLabel() {
    userInfoView.addSubview(userInfoLabel)
    userInfoLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      userInfoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
      userInfoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
      userInfoLabel.widthAnchor.constraint(equalToConstant: userInfoView.frame.width),
      userInfoLabel.heightAnchor.constraint(equalToConstant: userInfoView.frame.height)
    ])
    userInfoLabel.lineBreakMode = .byWordWrapping
    userInfoLabel.adjustsFontSizeToFitWidth = false
    userInfoLabel.numberOfLines = 0
    userInfoLabel.textColor = .black
    userInfoLabel.textAlignment = .left
    userInfoLabel.text = userInfoText()
  }
  //MARK: - 기능 세팅
  
  // 이름, 전화번호 리턴
  func userInfoText() -> String {
    let groupTitle = navigationItem.title
    let userCount = MessageData.messageUserList[groupTitle!]?.count
      for index in 0..<userCount! {
        for (key,value) in userList[groupTitle!]![index] {
          MessageData.userInfoName.append("\n\n(\(index + 1)) \(key)")
          MessageData.userInfoNumber.append("\n\n(\(index + 1)) \(value)")
        }
      }
    return "이름 : \(MessageData.userInfoName) \n\n번호 : \(MessageData.userInfoNumber)"
  }
  //이름, 전화번호 초기화
  func userInfoTextReload() {
    MessageData.userInfoName.removeAll()
    MessageData.userInfoNumber.removeAll()
  }
}
