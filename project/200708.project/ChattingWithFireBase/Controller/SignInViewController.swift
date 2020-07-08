//
//  SignInViewController.swift
//  
//
//  Created by 이진욱 on 2020/07/08.
//

import UIKit

class SignInViewController: UIViewController {
  // MARK: - Property
  
  private let vSign = SignInVIew()
  private let pSign = SignProvier()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraint()
  }
}
// MARK: - extension SignInViewController

extension SignInViewController {
  private func setUI() {
    view.backgroundColor = .systemBackground
    vSign.delegate = self
    view.addSubview(vSign)
  }
  
  private func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    
    vSign.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      vSign.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      vSign.bottomAnchor.constraint(equalTo: guide.centerYAnchor),
      vSign.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.8)
    ])
  }
}

// MARK: - UITextFieldDelegate

extension SignInViewController: SignInViewDelegate {
  func signInButtonDidTap(email: String?, password: String?) {
    guard let email = email, let password = password else { return }
    
    pSign.signIn(email: email, password: password) { (result) in
      switch result {
      case .failure(let error):
        self.alertNormal(title: error.localizedDescription)
      case .success:
        WindowManger.set(.chat)
      }
    }
  }
  
  func signUpButtonDidTap() {
    let signUpVC = SignUpViewController()
    present(signUpVC, animated: true)
  }
}


