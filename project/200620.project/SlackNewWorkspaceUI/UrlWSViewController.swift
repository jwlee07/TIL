//
//  UrlWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import AudioToolbox
import UIKit


final class UrlWSViewController: UIViewController {
  
  // MARK: - Property
  
  struct Margin {
    static let xButton: CGFloat = 30
    static let yButton: CGFloat = 10
    
    static let xTextfield: CGFloat = 10
    static let yTextfield: CGFloat = 100
    
    static let xLabel: CGFloat = 10
    static let yLabel: CGFloat = 100
  }
  
  var toggle = false
  var firstTextfieldText: String = ""
  var urlTextfieldX: NSLayoutConstraint?
  
  let defaultTextfieldText: UILabel = {
    let label = UILabel()
    label.text = ".slack.com"
    label.textColor = .systemGray
    return label
  }()
  
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
    textfield.font = UIFont.boldSystemFont(ofSize: 20)
    return textfield
  }()
  
  let infoTextfieldLabel: UILabel = {
    let label = UILabel()
    label.text = "Get a URL (Letters, numbers, and dashes only)"
    label.font = UIFont.boldSystemFont(ofSize: 15)
    label.shadowColor = .black
    return label
  }()
  
  let urlInfoLabel: UILabel = {
    let label = UILabel()
    label.text = "This is the address that you'll use to sign in to Slack."
    label.textColor = .systemGray
    label.font = UIFont.boldSystemFont(ofSize: 15)
    return label
  }()
  
  let errorLabel: UILabel = {
    let label = UILabel()
    label.text = "This URL is not available. Sorry!"
    label.textColor = .systemGray
    label.alpha = 0
    return label
  }()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupButton()
    setupTextField()
    setupLabel()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    infoTextfieldLabel.becomeFirstResponder()
  }
  
  // MARK: - setup Layout
  
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
      urlTextfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.midY - Margin.yTextfield)
    ])
    
    urlTextfield.borderStyle = .none
    urlTextfield.text = firstTextfieldText
    urlTextfieldX = urlTextfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Margin.xTextfield)
    urlTextfieldX!.isActive = true
  }
  
  func setupLabel() {
    let labelArr: [UILabel] = [infoTextfieldLabel, urlInfoLabel, defaultTextfieldText, errorLabel]
    for indexLabel in labelArr {
      view.addSubview(indexLabel)
      indexLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      infoTextfieldLabel.bottomAnchor.constraint(equalTo: urlTextfield.safeAreaLayoutGuide.topAnchor),
      infoTextfieldLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Margin.xLabel),
      infoTextfieldLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Margin.xLabel)
    ])
    NSLayoutConstraint.activate([
      urlInfoLabel.topAnchor.constraint(equalTo: urlTextfield.safeAreaLayoutGuide.bottomAnchor, constant: Margin.yLabel),
      urlInfoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Margin.xLabel),
      urlInfoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Margin.xLabel)
    ])
    
    NSLayoutConstraint.activate([
      defaultTextfieldText.topAnchor.constraint(equalTo: urlTextfield.safeAreaLayoutGuide.topAnchor),
      defaultTextfieldText.bottomAnchor.constraint(equalTo: urlTextfield.safeAreaLayoutGuide.bottomAnchor),
      defaultTextfieldText.leadingAnchor.constraint(equalTo: urlTextfield.trailingAnchor)
    ])
    
    NSLayoutConstraint.activate([
      errorLabel.topAnchor.constraint(equalTo: urlTextfield.safeAreaLayoutGuide.bottomAnchor),
      errorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Margin.xLabel),
      errorLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Margin.xLabel)
    ])
  }
  
  // MARK: - actionFunc
  
  @objc func actionButton (_ sender: UIButton) {
    switch sender.tag {
    case 0:
      navigationController?.popViewController(animated: true)
    case 1:
      if toggle {
        if urlTextfield.text == "error" || urlTextfield.text == "fail" {
          errorLabel.alpha = 1
          let checkPoint = Margin.xTextfield
          UIView.animateKeyframes(
            withDuration: 0.3,
            delay: 0,
            options: [.autoreverse],
            animations: {
              UIView.addKeyframe(
                withRelativeStartTime: 0,
                relativeDuration: 0.15) {
                  self.urlTextfieldX?.constant = (-checkPoint / 4)
                  self.view.layoutIfNeeded()
              }
              UIView.addKeyframe(
                withRelativeStartTime: 0.15,
                relativeDuration: 0.15) {
                  self.urlTextfieldX?.constant = checkPoint
                  self.view.layoutIfNeeded()
              }})
        }
      } else {
        AudioServicesPlayAlertSound(4095)
      }
    default:
      break
    }
  }
}

// MARK: - TextfieldDelegate

extension UrlWSViewController: UITextFieldDelegate {
  func textFieldDidChangeSelection(_ textField: UITextField) {
    if !(urlTextfield.text!.isEmpty) {
      toggle = true
      nextButton.setTitleColor(.systemBlue, for: .normal)
      errorLabel.alpha = 0
    } else {
      toggle = false
      nextButton.setTitleColor(.systemGray, for: .normal)
      errorLabel.alpha = 0
    }
  }
}
