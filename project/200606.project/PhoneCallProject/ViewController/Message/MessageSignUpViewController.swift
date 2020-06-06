//
//  MessageSignUpViewController.swift
//  PhoneCallProject
//
//  Created by 이진욱 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class MessageSignUpViewController: UIViewController {
    
    let sginInButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSignUpView()
    }
    // MARK: - 레이아웃 생성
    func setupSignUpView() {
        view.backgroundColor = .systemBackground
        title = "그룹 등록"
        
        let signUpArr = [MessageData.groupTextfield, MessageData.nameTextfield, MessageData.numberTextfield, sginInButton]
        
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
            sginInButton.topAnchor.constraint(equalTo: MessageData.numberTextfield.bottomAnchor, constant: 32),
            sginInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            sginInButton.heightAnchor.constraint(equalToConstant: 50),
            sginInButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        sginInButton.setTitle("그룹 등록", for: .normal)
        sginInButton.setTitleColor(.white, for: .normal)
        sginInButton.layer.cornerRadius = 15
        sginInButton.clipsToBounds = true
        sginInButton.backgroundColor = .systemBlue
        sginInButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    }
    
    // MARK: - actionButton
    @objc func actionButton(_ sender: UIButton) {
        // 모든 텍스트 필드 입력 필요
        if MessageData.groupTextfield.text != "", MessageData.nameTextfield.text != "", MessageData.numberTextfield.text != "" {
            // 입력 받을 그룹, 이름, 번호 프로퍼티 생성
            let signGroup = MessageData.groupTextfield.text
            let signName = MessageData.nameTextfield.text
            let signNameArr = signName?.components(separatedBy: "/")
            let signNumber = MessageData.numberTextfield.text
            let signNumberArr = signNumber?.components(separatedBy: "/")
            // 이름, 번호 갯수 확인 후 데이터 값 저장
            if signNameArr?.count == signNumberArr?.count {
                MessageData.groupList.append(signGroup!)
                for index in 0...signNumberArr!.count - 1 {
                  if MessageData.messageUserList[signGroup!] != nil{
                      MessageData.messageUserList[signGroup!]?.append([signNameArr![index]:signNumberArr![index]])
                  } else {
                      MessageData.messageUserList.updateValue([[signNameArr![index]:signNumberArr![index]]], forKey: signGroup!)
                  }
                }
                // 입력 받은 그룹, 이름, 번호 Alert으로 추가 확인
                for index in 0...signNameArr!.count - 1 {
                    MessageData.userText += "\n(\(index+1)) \(signNameArr![index]) : \(signNumberArr![index])"
                }
                let resultAlert = UIAlertController (title: "그룹 등록 하시겠습니까 ?", message: "그룹명 : \(signGroup!) \n [ 이름 : 전화번호 ] \(MessageData.userText)", preferredStyle: .alert)
                // 확인 버튼 누를 시 그룹 추가 후 Text 초기화
                let resultAlertOk = UIAlertAction (title: "확인", style: .default) {_ in
                    self.navigationController?.popViewController(animated: true)
                    MessageData.frontGroup.append(signGroup!)
                    MessageData.groupTextfield.text = ""
                    MessageData.nameTextfield.text = ""
                    MessageData.numberTextfield.text = ""
                    MessageData.userText = ""
                }
                //취소 버튼 생성
                let resultAlertCancel = UIAlertAction (title: "취소", style: .cancel)
                resultAlert.addAction(resultAlertOk)
                resultAlert.addAction(resultAlertCancel)
                present(resultAlert, animated: true)
              // 이름, 번호 갯수 카운팅 후 맞지 않을 시 경고 Alert 발생
            } else {
                let checkCountAlert = UIAlertController (title: "경고", message: "이름과 번호 갯수가 맞지 않습니다.", preferredStyle: .alert)
                let checkCountAlertOk = UIAlertAction (title: "재입력", style: .default)
                checkCountAlert.addAction(checkCountAlertOk)
                present(checkCountAlert, animated: true)
                
            }
          // 그룹, 이름, 번호 중 하나라도 입력이 되지 않으면 경고 Alert 발생
        } else {
            let checkAlert = UIAlertController (title: "경고", message: "모두 입력하시오.", preferredStyle: .alert)
            let checkAlertOk = UIAlertAction (title: "재입력", style: .default)
            checkAlert.addAction(checkAlertOk)
            present(checkAlert, animated: true)
        }
    }
}


