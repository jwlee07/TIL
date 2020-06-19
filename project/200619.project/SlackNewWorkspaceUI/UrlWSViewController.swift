//
//  UrlWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import AudioToolbox
import UIKit


final class UrlWSViewController: UIViewController {
  
  struct Margin {
    static let xButton: CGFloat = 30
    static let yButton: CGFloat = 10
    
    static let xTextfield: CGFloat = 10
    static let yTextfield: CGFloat = 50
    
    static let xLabel: CGFloat = 10
    static let yLabel: CGFloat = 50
  }
  
  let cancleButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
    button.tag = 0
    return button
  }()
  
  let nextButton: UIButton = {
    let button = UIButton()
    button.setTitle("Next", for: .normal)
    button.setTitleColor(.systemGray, for: .normal)
    button.tag = 1
    return button
  }()
  
  let urlTextfield: UITextField = {
    let textfield = UITextField()
    textfield.placeholder = ".slack.com"
    return textfield
  }()
  
  let infoTextfieldLabel: UILabel = {
    let label = UILabel()
    label.text = "Get a URL (Letters, numbers, and dashes only"
    label.font = UIFont.boldSystemFont(ofSize: 5)
    label.shadowColor = .black
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupButton()
    setupTextField()
    setupInfoTextfieldLabel()
  }
  
  func setupButton() {
    let buttonArr: [UIButton] = [cancleButton, nextButton]
    for indexButton in buttonArr {
      indexButton.translatesAutoresizingMaskIntoConstraints = false
      indexButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
      view.addSubview(indexButton)
    }
    NSLayoutConstraint.activate([
      cancleButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Margin.yButton),
      cancleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Margin.xButton)
    ])
    
    NSLayoutConstraint.activate([
      nextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Margin.yButton),
      nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Margin.xButton)
    ])
  }
  
  func setupTextField() {
    view.addSubview(urlTextfield)
    urlTextfield.delegate = self
    urlTextfield.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      urlTextfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.midY - Margin.yTextfield),
      urlTextfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Margin.xTextfield),
      urlTextfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Margin.xTextfield)
    ])
    urlTextfield.borderStyle = .none
  }
  
  func setupInfoTextfieldLabel() {
    view.addSubview(infoTextfieldLabel)
    infoTextfieldLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      infoTextfieldLabel.bottomAnchor.constraint(lessThanOrEqualTo: urlTextfield.safeAreaLayoutGuide.topAnchor),
      infoTextfieldLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Margin.xLabel),
      infoTextfieldLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Margin.xLabel)
    ])
  }
  
  @objc func actionButton (_ sender: UIButton) {
    switch sender.tag {
    case 0:
      if let nameVC = presentingViewController as? NameWSViewController {
        nameVC.buffering.stopAnimating()
        nameVC.buffering.isHidden = true
        dismiss(animated: true)
      }
    default:
      break
    }
  }
}
extension UrlWSViewController: UITextFieldDelegate {
  
}
