//
//  AnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2020. 6. 4..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class AnimationViewController: UIViewController {
  
  // MARK: - Properties
  
  @IBOutlet private weak var userIdTextField: UITextField!
  @IBOutlet private weak var passwordTextField: UITextField!
  @IBOutlet private weak var loginButton: UIButton!
  @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
  @IBOutlet private weak var countDownLabel: UILabel!
  
  
  var count = 4 {
    didSet {
      countDownLabel.text = "\(count)"
    }
  }
  
  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    userIdTextField.center.x = -view.frame.width
    passwordTextField.center.x = -view.frame.width
    loginButton.center.x = -view.frame.width
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    // Frame : 부모 View 기준
    // Bounds : 자신 기준
    UIView.animate(withDuration: 1, animations: {self.userIdTextField.center.x = self.userIdTextField.superview!.bounds.midX})
    UIView.animate(withDuration: 1, delay: 0.3, animations:{self.passwordTextField.center.x = self.passwordTextField.superview!.bounds.midX})
    UIView.animate(
      withDuration: 1,
      delay: 1,
      usingSpringWithDamping: 0.5, // 0에 가까울 수록 큰 진동
      initialSpringVelocity: 0, // 초기 가해지는 힘
      options: [],
      animations: {self.loginButton.center.x = self.loginButton.superview!.bounds.midX
    }) {
      isFinished in
        print ("isFinished : ", isFinished)
    }
  }
  
  // MARK: - Action Handler
  
  @IBAction private func didEndOnExit(_ sender: Any) {}
  
  @IBAction private func login(_ sender: Any) {
    // transform - 크기, 회전, 이동
    guard countDownLabel.isHidden else {return}
    loginButtonAnimation()
    countDown()
  }

  
  func addAnimateKeyframes() {
    UIView.animateKeyframes(
      withDuration: 4,
      delay: 0,
      options: [],
      animations: {
        UIView.addKeyframe(
          withRelativeStartTime: 0, // 시작 시간 : withDuration * withRelativeStartTime
        relativeDuration: 0.25) {
          self.loginButton.center.x += 100.0
        }
        UIView.addKeyframe(
          withRelativeStartTime: 0.25,
          relativeDuration: 0.25) {
            self.loginButton.center.y += 100.0
        }
        UIView.addKeyframe(
          withRelativeStartTime: 0.5,
          relativeDuration: 0.25) {
            self.loginButton.center.x -= 100.0
        }
        UIView.addKeyframe(
          withRelativeStartTime: 0.75,
          relativeDuration: 0.25) {
            self.loginButton.center.y -= 100.0
        }
    }) { (isFinished) in
      print ("isFinished : ", isFinished)
      }
    
    UIView.animateKeyframes(
      withDuration: 4,
      delay: 0,
      options: [],
      animations: {
        UIView.addKeyframe(
          withRelativeStartTime: 0,
          relativeDuration: 0.25) {
            self.loginButton.center.x += 50.0
            self.loginButton.center.y += 50.0
        }
        UIView.addKeyframe(
          withRelativeStartTime: 0.25,
          relativeDuration: 0.25) {
            self.loginButton.transform = .init(rotationAngle: .pi / 3)
        }
        UIView.addKeyframe(
          withRelativeStartTime: 0.5,
          relativeDuration: 0.25) {
            self.loginButton.center.x += self.view.frame.width
            self.loginButton.center.y -= self.view.frame.height
        }
        
    }) { (isFinished) in
      print ("loginButtonAnimation isFinished : ", isFinished)
      self.activityIndicatorView.stopAnimating()
    }
    }
  
  
  func loginButtonAnimation() {
    activityIndicatorView.startAnimating()
    let centerLoginButton = loginButton.center
    UIView.animateKeyframes(
      withDuration: 1.6,
      delay: 0,
      options: [],
      animations: {
        UIView.addKeyframe(
          withRelativeStartTime: 0,
          relativeDuration: 0.25) {
            self.loginButton.center.x += 50.0
            self.loginButton.center.y += 20.0
        }
        UIView.addKeyframe(
          withRelativeStartTime: 0.25,
          relativeDuration: 0.25) {
            self.loginButton.transform = .init(rotationAngle: .pi / 4)
            self.loginButton.center.x += 150
            self.loginButton.center.y -= 70
            self.loginButton.alpha = 0
        }
        UIView.addKeyframe(
          withRelativeStartTime: 0.51,
          relativeDuration: 0.01) {
            self.loginButton.transform = .identity
            self.loginButton.center = CGPoint (x: centerLoginButton.x, y: self.loginButton.superview!.frame.height + 120)
        }
        UIView.addKeyframe(
          withRelativeStartTime: 0.75,
          relativeDuration: 0.25) {
            self.loginButton.alpha = 1.0
            self.loginButton.center = centerLoginButton
        }
    }) { (isFinished) in
      self.activityIndicatorView.stopAnimating()
    }
  }

  func countDown() {
    countDownLabel.isHidden = false
    UIView.transition(
      with: countDownLabel,
      duration: 0.5,
      options: [.transitionFlipFromLeft],
      animations: {
        self.count -= 1
    }) { (isFinished) in
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        guard self.count == 0 else { return self.countDown()}
        self.countDownLabel.isHidden = true
      }
    }
  }
}
