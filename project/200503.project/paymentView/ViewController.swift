//
//  ViewController.swift
//  paymentView
//
//  Created by 이진욱 on 2020/05/03.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let nameTextfield = UITextField()
  let idTextfield = UITextField()
  let passwordTextfield = UITextField()
  let loginButton = UIButton()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)
    createNameTextfield()
    createIdTextfield()
    createPasswordTextfield()
    createLoginButton()
  }
  func createNameTextfield() {
    nameTextfield.frame = CGRect (x: 10 , y: 100, width: 300, height: 50)
    nameTextfield.placeholder = "NAME"
    nameTextfield.borderStyle = .roundedRect
    nameTextfield.layer.cornerRadius = 15
    nameTextfield.clipsToBounds = true
    view.addSubview(nameTextfield)
  }
  func createIdTextfield() {
    idTextfield.frame = CGRect (x: 10 , y: 200, width: 300, height: 50)
    idTextfield.placeholder = "ID"
    idTextfield.borderStyle = .roundedRect
    idTextfield.layer.cornerRadius = 15
    idTextfield.clipsToBounds = true
    view.addSubview(idTextfield)
  }
  func createPasswordTextfield() {
    passwordTextfield.frame = CGRect (x: 10 , y: 300, width: 300, height: 50)
    passwordTextfield.placeholder = "PASSWORD"
    passwordTextfield.borderStyle = .roundedRect
    passwordTextfield.layer.cornerRadius = 15
    passwordTextfield.clipsToBounds = true
    passwordTextfield.isSecureTextEntry = true
    view.addSubview(passwordTextfield)
  }
  func createLoginButton() {
    loginButton.frame = CGRect (x: 10, y: 400, width: 100, height: 50)
    loginButton.setTitle("Login", for: .normal)
    loginButton.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
    loginButton.backgroundColor = .systemBlue
    loginButton.layer.cornerRadius = 15
    loginButton.clipsToBounds = true
    loginButton.addTarget(self, action: #selector(actionLogin), for: .touchUpInside)
    view.addSubview(loginButton)
  }
  @objc func actionLogin(_ sender: UIButton) {
    if nameTextfield.text! != "", idTextfield.text! != "", passwordTextfield.text! != "" {
      let loginAlert = UIAlertController(title: "\(nameTextfield.text!)님 환영합니다 !", message: nil, preferredStyle: .alert)
      let loginOk = UIAlertAction(title: "Go", style: .default, handler: presentMenu)
      let loginCancel = UIAlertAction(title: "Cancel", style: .destructive)
      loginAlert.addAction(loginOk)
      loginAlert.addAction(loginCancel)
      present(loginAlert, animated: true)
    } else {
      let failAlert = UIAlertController (title: "모두 입력 해주세요.", message: nil, preferredStyle: .alert)
      let failAlertOk = UIAlertAction (title: "재입력", style: .destructive)
      failAlert.addAction(failAlertOk)
      present(failAlert, animated: true)
    }
  }
  @objc func presentMenu(_ sender: Any) {
    let Menu = MenuViewController()
    Menu.modalPresentationStyle = .fullScreen
    present(Menu, animated: true)
    }
}

