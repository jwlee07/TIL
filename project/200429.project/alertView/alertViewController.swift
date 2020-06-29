//
//  alertViewController.swift
//  alertView
//
//  Created by 이진욱 on 2020/04/29.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit
import MapKit

class alertViewController: UIViewController {
  let alertView = UIView()
  let titleLabel = UILabel()
  let messageLabel = UILabel()
  let alertTextField = UITextField()
  let addButton = UIButton()
  let cancelButton = UIButton()
  
  
  override func viewDidLoad() {
    
    
    
    super.viewDidLoad()
    view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    createView()
    createTitleLabel()
    createMessageLabel()
    createTextField()
    createAddButton()
    createCancelButton()
  }
  override func viewWillAppear(_ animated: Bool) {
    alertTextField.becomeFirstResponder()
  }
  
  func createView() {
    alertView.frame = CGRect (x: view.center.x - 150, y: 200, width: 300, height: 300)
    alertView.backgroundColor = .lightGray
    view.addSubview(alertView)
  }
  func createTitleLabel() {
    titleLabel.frame = CGRect (x: (alertView.frame.width / 2) - 50, y: 0, width: 100, height: 50)
    titleLabel.text = "SetUp"
    titleLabel.textColor = .black
    titleLabel.textAlignment = .center
    alertView.addSubview(titleLabel)
  }
  func createMessageLabel() {
    messageLabel.frame = CGRect (x: (alertView.frame.width / 2) - 100, y: 50, width: 200, height: 50)
    messageLabel.text = "Add : 추가 , Cancel : 취소"
    messageLabel.textColor = .black
    messageLabel.textAlignment = .center
    alertView.addSubview(messageLabel)
  }
  func createTextField() {
    alertTextField.frame = CGRect (x: (alertView.frame.width / 2) - 100, y: 125, width: 200, height: 50)
    alertTextField.placeholder = "입력하시오"
    alertTextField.borderStyle = .roundedRect
    alertTextField.backgroundColor = .white
    alertTextField.textAlignment = .center
    alertView.addSubview(alertTextField)
  }
  func createAddButton() {
    addButton.frame = CGRect (x: (alertView.frame.width / 2) - 100, y: 225, width: 100, height: 50)
    addButton.setTitle("ADD", for: .normal)
    addButton.setTitleColor(.red, for: .normal)
    addButton.addTarget(self, action: #selector(actionAdd(_:)), for: .touchUpInside)
    alertView.addSubview(addButton)
  }
  func createCancelButton() {
    cancelButton.frame = CGRect (x: alertView.frame.width / 2, y: 225, width: 100, height: 50)
    cancelButton.setTitle("Cancle", for: .normal)
    cancelButton.setTitleColor(.blue, for: .normal)
    cancelButton.addTarget(self, action: #selector(actionCancle(_:)), for: .touchUpInside)
    alertView.addSubview(cancelButton)
  }
  @objc func actionAdd(_ sender: UIButton) {
    if let masterVC = presentingViewController as? ViewController {
      masterVC.viewLabel.text = alertTextField.text
    }
    dismiss(animated: true)
  }
  @objc func actionCancle(_ sender: UIButton) {
    dismiss(animated: true)
  }
}
