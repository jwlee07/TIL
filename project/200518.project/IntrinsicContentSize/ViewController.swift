//
//  ViewController.swift
//  IntrinsicContentSize
//
//  Created by 이진욱 on 2020/05/18.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let viewButton = UIButton()
  let blueView = UIView()
  
  var blueTopPoint: NSLayoutConstraint!
  
  var toggle = false
  let upButtonText = "UP"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createBlueView()
    createViewButton()
    blueViewPointSize()
    viewButtonPointSize()

  }
  func createBlueView() {
    blueView.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
    view.addSubview(blueView)
  }
  func createViewButton() {
    viewButton.setTitle("DOWN", for: .normal)
    viewButton.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
    viewButton.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
    viewButton.layer.cornerRadius = 10
    viewButton.clipsToBounds = true
    viewButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    view.addSubview(viewButton)
  }
  func blueViewPointSize() {
    blueView.translatesAutoresizingMaskIntoConstraints = false
    blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
    blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
    blueView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    
    blueTopPoint = blueView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
    blueTopPoint.isActive = true
  }
  func viewButtonPointSize() {
    viewButton.translatesAutoresizingMaskIntoConstraints = false
    
    viewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.center.x - 30).isActive = true
    viewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top + 100).isActive = true
  }
  @objc func actionButton(_ sender: UIButton) {
    toggle = !toggle
    let changeTopConstant = toggle ? 150 : 700
    UIView.animate(withDuration: 0.1) {
      self.blueTopPoint.constant = CGFloat(changeTopConstant)
      self.view.layoutIfNeeded()
    }
    if toggle {
      viewButton.setTitle("DOWN", for: .normal)
    } else {
      viewButton.setTitle("UP", for: .normal)
      
    }
  }
}

