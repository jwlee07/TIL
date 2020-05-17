//
//  SignInViewController.swift
//  FastCampusLogin
//
//  Created by 이진욱 on 2020/05/17.
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

class SignInViewController: UIViewController, UITextFieldDelegate {
  let signEmailText = UITextField()
  let signPasswordText = UITextField()
  
  let addButton = UIButton()
  let signOutButton = UIButton()
  
  var emailTextCheck = " "
  var passwordTextCheck = " "
  
  let margin: CGFloat = 50

    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
      createSignEmailText()
      createSignPasswordText()
      createAddButton()
      createSignOutButton()
      

    }
  func createSignEmailText() {
    signEmailText.delegate = self
    
    signEmailText.frame = CGRect (
      x: view.safeAreaInsets.left + margin,
      y: view.center.y - 100,
      width: view.frame.width - (margin * 2),
      height: view.frame.height / 20)
    signEmailText.borderStyle = .roundedRect
    signEmailText.placeholder = "Email"
    signEmailText.tag = 0
    view.addSubview(signEmailText)
  }
  
  func createSignPasswordText() {
    signPasswordText.delegate = self
    
    signPasswordText.frame = CGRect (
      x: view.safeAreaInsets.left + margin,
      y: view.center.y ,
      width: view.frame.width - (margin * 2),
      height: view.frame.height / 20)
    signPasswordText.borderStyle = .roundedRect
    signPasswordText.placeholder = "Password"
    signPasswordText.tag = 1
    view.addSubview(signPasswordText)
  }
  func createAddButton() {
    addButton.frame = CGRect (
      x: view.safeAreaInsets.left + margin,
      y: view.center.y + (view.center.y / 2),
      width: 100,
      height: 50)
    addButton.setTitle("ADD", for: .normal)
    addButton.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
    addButton.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    addButton.layer.cornerRadius = 15
    addButton.clipsToBounds = true
    addButton.addTarget(self, action: #selector(actionAddButton), for: .touchUpInside)
    view.addSubview(addButton)
  }
  func createSignOutButton() {
    signOutButton.frame = CGRect (
      x: signEmailText.frame.maxX - 100,
      y: view.center.y + (view.center.y / 2),
      width: 100,
      height: 50)
    signOutButton.setTitle("Sign Out", for: .normal)
    signOutButton.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
    signOutButton.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
    signOutButton.layer.cornerRadius = 15
    signEmailText.clipsToBounds = true
    signOutButton.addTarget(self, action: #selector(actionSignOutButoon), for: .touchUpInside)
    view.addSubview(signOutButton)
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    emailTextCheck = signEmailText.text!
    passwordTextCheck = signPasswordText.text!
    
    print ("emailTextCheck : ", emailTextCheck)
    print ("passwordTextCheck : ", passwordTextCheck)
    
    textField.resignFirstResponder()
      
    return true
  }
  
  @objc func actionSignOutButoon(_ sender: UIButton) {
    if let LoginView = presentingViewController as? ViewController {
      dismiss(animated: true)
    }
  }
  @objc func actionAddButton(_ sender: UIButton) {
    if let loginView = presentingViewController as? ViewController {
      if loginView.loginList.bool(forKey: emailTextCheck) == false {
        loginView.loginList.set(passwordTextCheck, forKey: emailTextCheck)
        let addAlert = UIAlertController (title: "가입완료", message: "\(emailTextCheck)님 환영합니다 !", preferredStyle: .alert)
        let addOk = UIAlertAction(title: "확인", style: .default)
        addAlert.addAction(addOk)
        present(addAlert, animated: true)
      }
    }
  }
}
