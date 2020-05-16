//
//  ViewController.swift
//  FastCampusLogin
//
//  Created by 이진욱 on 2020/05/16.
//  Copyright © 2020 jwlee. All rights reserved.
//

// [필수 구현]
// // 코드작성
// 1. 별도 첨부한 이미지와 같이 UI 구현. 원하는 형식으로 바꿔도 무관
// 2. 텍스트 필드는 UITextField 이용
// 3. 키보드에 의해 아이디와 비밀번호 textField가 가릴 수 있으므로
//    키보드가 나타날 때는 텍스트필드 위로 끌어올리고 내려갈 때는 같이 내려가기
// 4. 미리 설정해둔 아이디와 비밀번호가 동일할 경우 로그인이 완료된 메인 화면으로 이동
// 5. 다시 로그인 화면으로 돌아갈 수 있는 Sign Out 버튼 구성
//
//
// [ 추가 기능]
// 1. 미리 설정해둔 아이디와 비밀번호가 다를 경우 텍스트필드의 바탕화면을 일시적으로 빨갛게 만들었다가 원상 복구하기

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  struct Image {
    static let email = UIImage (named: "email.png")
    static let fastcampusLogo = UIImage (named: "fastcampus_logo.png")
    static let password = UIImage (named: "password.png")
    static let user = UIImage (named: "user.png")
    
    static let emailView = UIImageView()
    static let fastcampusLogoView = UIImageView()
    static let passwordView = UIImageView()
    static let userView = UIImageView()
    
    static let containerView = UIView()
    static let quadrangleFirst = UIView()
    static let quadrangleSecond = UIView()
    static let quadrangleThird = UIView()
  }
   
  struct Text {
    static var email = UITextField()
    static var password = UITextField()
    static let emailBorder = CALayer()
    static let passwordBorder = CALayer()
    
  }
  
  let loginList = UserDefaults.standard
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    
    loginList.set("qwqqw1332", forKey: "jwlee07")
    
  }

  override func viewWillLayoutSubviews() {
    let viewWidth = view.frame.width
    let viewHeight = view.frame.height
    let viewSafeTop = view.safeAreaInsets.top
    let viewSafeLeft = view.safeAreaInsets.left
    let viewSafeRight = view.safeAreaInsets.right
    let margin: CGFloat = 50
    let loginButton = UIButton()
    let signinButton = UIButton()
    
  
    Image.fastcampusLogoView.frame = CGRect (
      x: viewSafeLeft + 50,
      y: viewSafeTop + 30,
      width: viewWidth - ( margin * 2) - (viewSafeLeft + viewSafeRight),
      height: viewHeight / 10)
    Image.fastcampusLogoView.image = Image.fastcampusLogo
    view.addSubview(Image.fastcampusLogoView)
    
    Image.containerView.frame = CGRect (
      x: Image.fastcampusLogoView.frame.maxX / 3,
      y: Image.fastcampusLogoView.frame.maxY + 10,
      width: (viewWidth - ( margin * 2) - (viewSafeLeft + viewSafeRight)) / 2,
      height: viewHeight / 10)
    Image.containerView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    view.addSubview(Image.containerView)
    
    Image.quadrangleFirst.frame = CGRect (
      x: 0,
      y: 0,
      width: Image.containerView.frame.width / 5,
      height: Image.containerView.frame.height / 3)
    Image.quadrangleFirst.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    Image.quadrangleFirst.layer.cornerRadius = 7
    Image.quadrangleFirst.clipsToBounds = true
    Image.containerView.addSubview(Image.quadrangleFirst)
    
    Image.quadrangleSecond.frame = CGRect (
      x: (Image.containerView.frame.width / 2) - (Image.containerView.frame.width / 5) / 2,
      y: 0,
      width: Image.containerView.frame.width / 5,
      height: Image.containerView.frame.height / 3)
    Image.quadrangleSecond.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    Image.quadrangleSecond.layer.cornerRadius = 7
    Image.quadrangleSecond.clipsToBounds = true
    Image.containerView.addSubview(Image.quadrangleSecond)
    
    Image.quadrangleThird.frame = CGRect (
      x: (Image.containerView.frame.width) - Image.containerView.frame.width / 5,
      y: 0,
      width: Image.containerView.frame.width / 5,
      height: Image.containerView.frame.height / 3)
    Image.quadrangleThird.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    Image.quadrangleThird.layer.cornerRadius = 7
    Image.quadrangleThird.clipsToBounds = true
    Image.containerView.addSubview(Image.quadrangleThird)
    
    Image.emailView.frame = CGRect (
      x: viewSafeLeft + 50,
      y: view.center.y - (view.center.y / 5),
      width: viewWidth / 27,
      height: viewHeight / 27)
    Image.emailView.image = Image.email
    view.addSubview(Image.emailView)
    
    Image.userView.frame = CGRect (
      x: viewSafeLeft + 50,
      y: view.center.y,
      width: viewWidth / 27,
      height: viewHeight / 27)
    Image.userView.image = Image.user
    view.addSubview(Image.userView)
    
    loginButton.frame = CGRect (
      x: viewSafeLeft + 50,
      y: viewHeight / 1.5,
      width: viewWidth - ( margin * 2) - ( viewSafeLeft + viewSafeRight),
      height: viewHeight / 10 - view.safeAreaInsets.top)
    loginButton.setTitle("Login", for: .normal)
    loginButton.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
    loginButton.backgroundColor = #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
    loginButton.layer.cornerRadius = 10
    loginButton.clipsToBounds = true
    loginButton.addTarget(self, action: #selector(actionLoginButton), for: .touchUpInside)
    view.addSubview(loginButton)
    
    signinButton.frame = CGRect (
      x: viewSafeLeft + 50,
      y: loginButton.frame.midY + loginButton.frame.height,
      width: viewWidth - ( margin * 2) - ( viewSafeLeft + viewSafeRight),
      height: viewHeight / 10 - view.safeAreaInsets.top)
    signinButton.setTitle("Sing In", for: .normal)
    signinButton.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
    signinButton.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
    signinButton.layer.cornerRadius = 10
    signinButton.clipsToBounds = true
    view.addSubview(signinButton)
    
    Text.email.frame = CGRect (
     x: Image.emailView.frame.maxX + 20,
     y: view.center.y - (view.center.y / 5),
     width: viewWidth / 1.5,
     height: viewHeight / 27)
    Text.emailBorder.frame = CGRect(x: 0, y: Text.email.frame.size.height-1, width: Text.email.frame.width, height: 1)
    Text.emailBorder.backgroundColor = #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)
    Text.email.layer.addSublayer(Text.emailBorder)
    Text.email.textAlignment = .left
    Text.email.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    Text.email.borderStyle = .none
    Text.email.placeholder = "이메일을 입력하세오."
    Text.email.addTarget(self, action: #selector(textFieldDidBeginEditing), for: .editingDidBegin)
    view.addSubview(Text.email)
    
    Text.password.frame = CGRect (
      x: Image.userView.frame.maxX + 20,
      y: view.center.y,
      width: viewWidth / 1.5,
      height: viewHeight / 27)
    Text.passwordBorder.frame = CGRect(x: 0, y: Text.password.frame.size.height-1, width: Text.password.frame.width, height: 1)
    Text.passwordBorder.backgroundColor = #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)
    Text.password.layer.addSublayer(Text.passwordBorder)
    Text.password.textAlignment = .left
    Text.password.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    Text.password.borderStyle = .none
    Text.password.placeholder = "비밀번호를 입력하시오."
    Text.password.isSecureTextEntry = true
    Text.password.addTarget(self, action: #selector(textFieldDidBeginEditing), for: .editingDidBegin)
    Text.password.addTarget(self, action: #selector(textFieldShouldReturn), for: .editingDidEndOnExit)
    view.addSubview(Text.password)
  }
  @objc func textFieldDidBeginEditing(_ textField: UITextField) {
      Text.email.frame = CGRect (
       x: Image.emailView.frame.maxX + 20,
       y: view.center.y - (view.center.y / 3),
       width: view.frame.width / 1.5,
       height: view.frame.height / 27)
      
      Image.emailView.frame = CGRect (
        x: view.safeAreaInsets.left + 50,
        y: view.center.y - (view.center.y / 3),
        width: view.frame.width / 27,
        height: view.frame.height / 27)
      Image.emailView.image = Image.email
      
      Text.password.frame = CGRect (
        x: Image.userView.frame.maxX + 20,
        y: view.center.y - (view.center.y / 3) + (view.frame.height / 27) + 50 ,
        width: view.frame.width / 1.5,
        height: view.frame.height / 27)
      
      Image.userView.frame = CGRect (
        x: view.safeAreaInsets.left + 50,
        y: view.center.y - (view.center.y / 3) + (view.frame.height / 27) + 50,
        width: view.frame.width / 27,
        height: view.frame.height / 27)
  }
  
  @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == Text.password {
      Text.email.frame = CGRect (
        x: Image.emailView.frame.maxX + 20,
        y: view.center.y - (view.center.y / 5),
        width: view.frame.width / 1.5,
        height: view.frame.height / 27)
      
      Image.emailView.frame = CGRect (
        x: view.safeAreaInsets.left + 50,
        y: view.center.y - (view.center.y / 5),
        width: view.frame.width / 27,
        height: view.frame.height / 27)
      Image.emailView.image = Image.email
      
      Text.password.frame = CGRect (
        x: Image.userView.frame.maxX + 20,
        y: view.center.y,
        width: view.frame.width / 1.5,
        height: view.frame.height / 27)
      
      Image.userView.frame = CGRect (
        x: view.safeAreaInsets.left + 50,
        y: view.center.y,
        width: view.frame.width / 27,
        height: view.frame.height / 27)
    }
    return true
  }
  @objc func actionLoginButton(_ sender: UIButton) {
    if let loginCheck = loginList.object(forKey: Text.email.text!) as? String {
      if loginCheck == Text.password.text! {
        let afterLogin = AfterLoginViewController()
        afterLogin.modalPresentationStyle = .fullScreen
        present(afterLogin, animated: true)
      } else {
        UIView.animate(withDuration: 0.6) {
          Text.email.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
          Text.password.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
          Text.email.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          Text.password.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
      }
    }
  }
}
