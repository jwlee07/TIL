//
//  SignInVIew.swift
//  ChattingWithFireBase
//
//  Created by 이진욱 on 2020/07/08.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit


protocol SignInViewDelegate: class {
  func signInButtonDidTap(email: String?, password: String?)
  
  func signUpButtonDidTap()
}

class SignInVIew: UIView {
  
  // MARK: - Property
  
  weak var delegate: SignInViewDelegate?
  
  private let emailTextField = UITextField()
  private let passwordTextField = UITextField()
  private let signInButton = UIButton()
  private let signUpButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraint()
    
  }
  
  // MARK: - View Init
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup Layout
  private func setUI() {
    emailTextField.placeholder = "이메일 입력해 주세요."
    emailTextField.keyboardType = .emailAddress
    
    passwordTextField.placeholder = "비밀번호를 입력해 주세요."
    passwordTextField.isSecureTextEntry = true
    
    [emailTextField, passwordTextField].forEach {
      $0.font = .systemFont(ofSize: 30)
      $0.backgroundColor = UIColor.darkGray.withAlphaComponent(0.1)
    }
    
    signInButton.setTitle("입장", for: .normal)
    signInButton.backgroundColor = .darkGray
    
    signUpButton.setTitle("회원가입", for: .normal)
    signUpButton.backgroundColor = .systemBlue
    
    [signInButton, signUpButton].forEach {
      $0.setTitleColor(.white, for: .normal)
      $0.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
  }
  private struct Standard {
    static let space: CGFloat = 16
  }
  
  private func setConstraint() {
    [emailTextField, passwordTextField, signInButton, signUpButton].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      if let _ = $0 as? UITextField {
        $0.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        $0.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
      }
      
      if let _ = $0 as? UIButton {
        $0.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 120).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
      }
    }
    
    NSLayoutConstraint.activate([
      emailTextField.topAnchor.constraint(equalTo: self.topAnchor),
      
      passwordTextField.topAnchor.constraint(equalTo: emailTextField.safeAreaLayoutGuide.bottomAnchor, constant: Standard.space),
      
      signInButton.topAnchor.constraint(equalTo: passwordTextField.safeAreaLayoutGuide.bottomAnchor, constant: Standard.space),
      
      signUpButton.topAnchor.constraint(equalTo: signInButton.safeAreaLayoutGuide.bottomAnchor, constant: Standard.space),
      signUpButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    
    ])
  }
  // MARK: -  Action
  
  @objc private func buttonDidTap(_ sender: UIButton) {
    sender == signInButton ?
      delegate?.signInButtonDidTap(email: emailTextField.text, password: passwordTextField.text) :
      delegate?.signUpButtonDidTap()
  }
}
