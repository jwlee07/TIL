//
//  ViewController.swift
//  wookiGame1
//
//  Created by 이진욱 on 2020/05/22.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let stopButton = UIButton()
  let startButton = UIButton()
  
  let upDownView = UIView()
  let standardView = UIView()
  
  let padding: CGFloat = 50
  let margin: CGFloat = 100
  let viewHeight: CGFloat = 100
  
  var checkDistance: CGFloat = 0
  var standardDistance: CGFloat = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    
    createViewAdd()
    createViewPoint()
    
  }
  func createViewAdd() {
    stopButton.setTitle(" C H E C K ", for: .normal)
    stopButton.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
    stopButton.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    stopButton.layer.cornerRadius = 15
    stopButton.clipsToBounds = true
    stopButton.tag = 0
    stopButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    
    startButton.setTitle(" S T A R T ", for: .normal)
    startButton.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
    startButton.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
    startButton.layer.cornerRadius = 15
    startButton.clipsToBounds = true
    startButton.tag = 1
    startButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    
    upDownView.backgroundColor = #colorLiteral(red: 0.8446564078, green: 0.5145705342, blue: 1, alpha: 1)
    upDownView.layer.cornerRadius = 45
    upDownView.clipsToBounds = true
    
    standardView.backgroundColor = #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
    standardView.layer.cornerRadius = 45
    standardView.clipsToBounds = true
    
    view.addSubview(stopButton)
    view.addSubview(startButton)
    view.addSubview(standardView)
    view.addSubview(upDownView)
  }
  func createViewPoint() {
    stopButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stopButton.topAnchor.constraint(equalTo: view.topAnchor, constant: margin),
      stopButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.safeAreaInsets.left + padding)])

    startButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      startButton.topAnchor.constraint(equalTo: view.topAnchor, constant: margin),
      startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.safeAreaInsets.right + padding))])
    
    upDownView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      upDownView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.safeAreaInsets.left + margin),
      upDownView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.safeAreaInsets.right + margin)),
      upDownView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top + margin + (padding * 2)),
      upDownView.heightAnchor.constraint(equalToConstant: viewHeight)])
    
    standardView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      standardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.safeAreaInsets.left + margin),
      standardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.safeAreaInsets.right + margin)),
      standardView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.center.y - (viewHeight/2)),
      standardView.heightAnchor.constraint(equalToConstant: viewHeight)])
  }
  @objc func actionButton(_ sender: UIButton) {
    if sender.tag == 1 {
      UIView.animate(withDuration: 0.75, delay: 0, options: [.autoreverse, .repeat], animations: {self.upDownView.center.y = (self.view.frame.height - (self.view.safeAreaInsets.bottom  + self.viewHeight))})
    } else {
      let stopAlert = UIAlertController (title: "결과", message: "중간에서부터 \(upDownView.center.y)만큼 떨어져 있습니다.", preferredStyle: .alert)
      let stopAlertOk = UIAlertAction (title: "다시하기", style: .default)
      stopAlert.addAction(stopAlertOk)
      present(stopAlert, animated: true)
    }
  }
}

