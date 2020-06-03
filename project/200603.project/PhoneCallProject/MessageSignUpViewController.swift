//
//  MessageSignUpViewController.swift
//  PhoneCallProject
//
//  Created by 이진욱 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class MessageSignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      setupSignUpView()
    }
  func setupSignUpView() {
    view.backgroundColor = .systemBackground
    title = "그룹 추가"
    
    let signUpArr = [MessageData.groupTextfield, MessageData.nameTextfield, MessageData.numberTextfield, MessageData.sginInButton, MessageData.sginOutButton]
    
    for index in signUpArr {
      view.addSubview(index)
      index.translatesAutoresizingMaskIntoConstraints = false
    }
  
    NSLayoutConstraint.activate([
      MessageData.groupTextfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
      MessageData.groupTextfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
      MessageData.groupTextfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
      MessageData.groupTextfield.heightAnchor.constraint(equalToConstant: 50)
    ])
    
    MessageData.groupTextfield.placeholder = "그룹명 입력"
    MessageData.groupTextfield.textAlignment = .left
    MessageData.groupTextfield.borderStyle = .roundedRect
    MessageData.groupTextfield.tag = 0
    
    NSLayoutConstraint.activate([
      MessageData.nameTextfield.topAnchor.constraint(equalTo: MessageData.groupTextfield.bottomAnchor, constant: 32),
        MessageData.nameTextfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        MessageData.nameTextfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        MessageData.nameTextfield.heightAnchor.constraint(equalTo: MessageData.groupTextfield.heightAnchor, multiplier: 1.0)
    ])
    MessageData.nameTextfield.placeholder = "이름 입력 ( / 로 구분)"
    MessageData.nameTextfield.textAlignment = .left
    MessageData.nameTextfield.borderStyle = .roundedRect
    MessageData.nameTextfield.tag = 1
    
    NSLayoutConstraint.activate([
      MessageData.numberTextfield.topAnchor.constraint(equalTo: MessageData.nameTextfield.bottomAnchor, constant: 32),
        MessageData.numberTextfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        MessageData.numberTextfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        MessageData.numberTextfield.heightAnchor.constraint(equalTo: MessageData.nameTextfield.heightAnchor, multiplier: 1.0)
    ])
    MessageData.numberTextfield.placeholder = "번호 입력 ( - 제외, / 로 구분)"
    MessageData.numberTextfield.textAlignment = .left
    MessageData.numberTextfield.borderStyle = .roundedRect
    MessageData.numberTextfield.tag = 2
    
    NSLayoutConstraint.activate([
      MessageData.sginInButton.topAnchor.constraint(equalTo: MessageData.numberTextfield.bottomAnchor, constant: 32),
        MessageData.sginInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        MessageData.sginInButton.heightAnchor.constraint(equalToConstant: 50),
        MessageData.sginInButton.widthAnchor.constraint(equalToConstant: 100)
    ])
    MessageData.sginInButton.setTitle("SIGN IN", for: .normal)
    MessageData.sginInButton.setTitleColor(.white, for: .normal)
    MessageData.sginInButton.layer.cornerRadius = 15
    MessageData.sginOutButton.clipsToBounds = true
    MessageData.sginInButton.backgroundColor = .systemBlue
    MessageData.sginInButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
  }
  @objc func actionButton(_ sender: UIButton) {
    if MessageData.groupTextfield.text != "", MessageData.nameTextfield.text != "", MessageData.numberTextfield.text != "" {
      let signGroup = MessageData.groupTextfield.text
      let signName = MessageData.nameTextfield.text
      let signNameArr = signName?.components(separatedBy: "/")
      let signNumber = MessageData.numberTextfield.text
      let signNumberArr = signNumber?.components(separatedBy: "/")
      
      if signNameArr?.count == signNumberArr?.count {
        for index in 0...signNumberArr!.count - 1 {
          if MessageData.messageUserList[signGroup!] != nil {
            MessageData.messageUserList[signGroup!] = [signNameArr![index]:signNumberArr![index]]
          } else {
            MessageData.messageUserList.updateValue([signNameArr![index]:signNumberArr![index]], forKey: signGroup!)
          }
        }
        let resultAlert = UIAlertController (title: "추가하시겠습니까?", message: "그룹명 : \(signGroup!) \n 이름 : \(signNameArr!) \n 전화번호 : \(signNumberArr!)", preferredStyle: .alert)
        let resultAlertOk = UIAlertAction (title: "확인", style: .default) {_ in
          
          self.navigationController?.popViewController(animated: true)
          MessageData.group.insert(signGroup!, at: 1)
          MessageData.groupTextfield.text = ""
          MessageData.nameTextfield.text = ""
          MessageData.numberTextfield.text = ""
                
        }
        let resultAlertCancel = UIAlertAction (title: "취소", style: .cancel)
        resultAlert.addAction(resultAlertOk)
        resultAlert.addAction(resultAlertCancel)
        present(resultAlert, animated: true)
      } else {
        let checkCountAlert = UIAlertController (title: "경고", message: "이름과 번호 갯수가 맞지 않습니다.", preferredStyle: .alert)
        let checkCountAlertOk = UIAlertAction (title: "재입력", style: .default)
        checkCountAlert.addAction(checkCountAlertOk)
        present(checkCountAlert, animated: true)
        
      }
    } else {
      let checkAlert = UIAlertController (title: "경고", message: "모두 입력하시오.", preferredStyle: .alert)
      let checkAlertOk = UIAlertAction (title: "재입력", style: .default)
      checkAlert.addAction(checkAlertOk)
      present(checkAlert, animated: true)
    }
  }
}


