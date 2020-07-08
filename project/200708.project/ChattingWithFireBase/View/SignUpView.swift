//
//  SignUpView.swift
//  ChattingWithFireBase
//
//  Created by 이진욱 on 2020/07/08.
//  Copyright © 2020 jwlee. All rights reserved.
//


import UIKit

protocol SignUpViewDelegate: class {
  func signUpButtonDidTap(email: String?, password: String?, nickName: String?)
}

class SignUpView: UIView {
  
  // MARK: - Property
  
  weak var delegate: SignUpViewDelegate?
  
  private let emailTextField = UITextField()
  private let passwordTextField = UITextField()
  private let nickNameTextField = UITextField()
  private let signUpButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    emailTextField.placeholder = "이메일를 입력해주세요"
    emailTextField.keyboardType = .emailAddress
    
    passwordTextField.placeholder = "비밀번호를 입력해주세요"
    passwordTextField.isSecureTextEntry = true
    
    nickNameTextField.placeholder = "별명을 입력해주세요"
    
    [emailTextField, passwordTextField, nickNameTextField].forEach {
      $0.font = UIFont.systemFont(ofSize: 30)
      $0.backgroundColor = UIColor.darkGray.withAlphaComponent(0.1)
    }
    
    signUpButton.setTitle("회원가입", for: .normal)
    signUpButton.backgroundColor = .systemBlue
    signUpButton.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
  }
  
  private struct Standard {
    static let space: CGFloat = 16
  }
  
  private func setConstraint() {
    [emailTextField, passwordTextField, nickNameTextField, signUpButton].forEach {
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
      emailTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space),
      
      passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Standard.space),
      
      nickNameTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Standard.space),
      
      signUpButton.topAnchor.constraint(equalTo: nickNameTextField.bottomAnchor, constant: Standard.space),
      signUpButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space)
    ])
  }
  
  // MARK: - Action
  
  @objc private func buttonDidTap(_ sender: UIButton) {
    delegate?.signUpButtonDidTap(
      email: emailTextField.text,
      password: passwordTextField.text,
      nickName: nickNameTextField.text
    )
  }

}

