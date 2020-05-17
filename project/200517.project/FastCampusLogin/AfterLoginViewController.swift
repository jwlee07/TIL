//
//  AfterLoginViewController.swift
//  FastCampusLogin
//
//  Created by 이진욱 on 2020/05/16.
//  Copyright © 2020 jwlee. All rights reserved.
//
// [ 필수 구현 기능 ]
//
// 1. 별도 첨부한 이미지와 같이 UI 구현. 원하는 형식으로 바꿔도 무관
// 2. 텍스트 필드는 UITextFieldDelegate 이용
// 3. 키보드에 의해 아이디와 비밀번호 textField가 가릴 수 있으므로
//    키보드가 나타날 때는 텍스트필드 위로 끌어올리고 내려갈 때는 같이 내려가기
// 4. 미리 설정해둔 아이디와 비밀번호가 동일할 경우 로그인이 완료된 메인 화면으로 이동
// 5. 메인 화면에서는 입력받은 아이디를 출력하는 Label을 띄우고
//    다시 로그인 화면으로 돌아갈 수 있는 Sign Out 버튼 구성
//
//
// [ 추가 기능 (1) ]
// 1. 미리 설정해둔 아이디와 비밀번호가 다를 경우 텍스트필드의 바탕화면을 일시적으로 빨갛게 만들었다가 원상 복구하기
// 2. 텍스트필드에 입력할 수 있는 최대 글자 수는 16자까지
// 3. 아이디와 비밀번호는 모두 4 ~ 16자 사이여야 함
//
//
// [ 추가 기능 (2) ]
// 1. 자동 로그인
// 한 번 로그인에 성공했으면 Sign Out을 하기 전에는 앱을 껏다 켜도 자동 로그인된 상태로 메인 화면으로 진입
//
// 2. 회원 가입 페이지
// 회원가입 페이지를 만든 뒤 회원 가입한 유저의 아이디와 비밀번호를 추가하고
// 그것으로도 로그인 할 수 있도록 구현하기

import UIKit

class AfterLoginViewController: UIViewController {
    let dismissButton = UIButton()
    let emailLabel = UILabel()
  
  var emailText = "Email" {
    didSet {
      
    }
  }
    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
      createDismissButton()
      createEmailLabel()
    }
  func createDismissButton() {
    dismissButton.frame = CGRect (
      x: view.center.x - 50,
      y: view.center.y,
      width: 100,
      height: 50)
    dismissButton.setTitle("Sign Out", for: .normal)
    dismissButton.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
    dismissButton.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    dismissButton.addTarget(self, action: #selector(actionDismissButton), for: .touchUpInside)
    view.addSubview(dismissButton)
  }
  func createEmailLabel() {
    emailLabel.frame = CGRect (
      x: view.center.x - 100,
      y: view.center.y - 100,
      width: 200,
      height: 50)
    emailLabel.text = emailText
    emailLabel.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    emailLabel.textAlignment = .center
    view.addSubview(emailLabel)
  }
  
  @objc func actionDismissButton(_ sender: UIButton) {
    dismiss(animated: true)
  }
  
}
