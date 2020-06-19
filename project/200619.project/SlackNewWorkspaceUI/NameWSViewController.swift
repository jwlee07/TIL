//
//  NameWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit
import AudioToolbox

final class NameWSViewController: UIViewController {
  
  
  // MARK: - Property
  struct Margin {
    static let xButton: CGFloat = 30
    static let yButton: CGFloat = 10
    
    static let xTextfield: CGFloat = 10
    static let yTextfield: CGFloat = 50
    
    static var yLabel: NSLayoutConstraint?
  }
  
  let cancelButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "xmark"), for: .normal)
    button.tintColor = .black
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
  
  let nameTextfield: UITextField = {
    let textfield = UITextField()
    textfield.placeholder = "Name your WorkSpace"
    return textfield
  }()
  
  let infoLabel: UILabel = {
    let label = UILabel()
    label.text = "Name your WorkSpace"
    label.textAlignment = .left
    label.alpha = 0
    return label
  }()
  
  let buffering: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.color = .black
    activityIndicator.hidesWhenStopped = true
    return activityIndicator
  }()
  
  var toggle = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupButton()
    setupTextfield()
    setupLabel()
    setupBuffering()
  }
  
  // MARK: - Setup LayOut
  func setupButton() {
    navigationController?.navigationBar.isHidden = true
    let buttonArr: [UIButton] = [cancelButton, nextButton]
    for indexButton in buttonArr {
      view.addSubview(indexButton)
      indexButton.translatesAutoresizingMaskIntoConstraints = false
      indexButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    }
    
    NSLayoutConstraint.activate([
      cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Margin.yButton),
      cancelButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Margin.xButton)
    ])
    
    NSLayoutConstraint.activate([
      nextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Margin.yButton),
      nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Margin.xButton)
    ])
  }
  
  func setupTextfield() {
    view.addSubview(nameTextfield)
    nameTextfield.delegate = self
    nameTextfield.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      nameTextfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.midY - Margin.yTextfield),
      nameTextfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Margin.xTextfield),
      nameTextfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Margin.xTextfield),
    ])
    nameTextfield.borderStyle = .none
  }
  func setupLabel() {
    view.addSubview(infoLabel)
    infoLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      infoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Margin.xTextfield),
      infoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Margin.xTextfield),
    ])
    Margin.yLabel = infoLabel.bottomAnchor.constraint(equalTo: nameTextfield.safeAreaLayoutGuide.bottomAnchor)
    Margin.yLabel?.isActive = true
  }
  
  func setupBuffering() {
    view.addSubview(buffering)
    buffering.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      buffering.topAnchor.constraint(equalTo: nameTextfield.safeAreaLayoutGuide.topAnchor),
      buffering.trailingAnchor.constraint(equalTo: nameTextfield.safeAreaLayoutGuide.trailingAnchor)
    ])
  }

  // MARK: - Action
  
  @objc func actionButton(_ sender: UIButton) {
    switch sender.tag {
    case 0:
      dismiss(animated: true)
    case 1:
      if toggle {
        AudioServicesPlayAlertSound(4095)
        buffering.isHidden = false
        buffering.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
          let urlVC = UrlWSViewController()
          urlVC.view.backgroundColor = .systemBackground
          self.navigationController?.pushViewController(urlVC, animated: true)
        }
      }
    default:
      break
    }
  }
}
// MARK: - TextField Delegate

extension NameWSViewController: UITextFieldDelegate {
  func textFieldDidChangeSelection(_ textField: UITextField) {
    let changePoint = self.nameTextfield.frame.height
    if !(nameTextfield.text!.isEmpty) {
      toggle = true
      nextButton.setTitleColor(.systemBlue, for: .normal)
      UIView.animate(withDuration: 0.3) {
        self.infoLabel.alpha = 1
        self.infoLabel.shadowColor = .black
        if self.toggle {Margin.yLabel?.constant = -changePoint}
        self.view.layoutIfNeeded()
      }
    } else {
      toggle = false
      UIView.animate(withDuration: 0.3) {
        self.nextButton.setTitleColor(.systemGray, for: .normal)
        self.infoLabel.alpha = 0
        if !(self.toggle) {Margin.yLabel?.constant = (changePoint / 2)}
        self.view.layoutIfNeeded()
      }
    }
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if toggle {
      AudioServicesPlayAlertSound(4095)
      buffering.isHidden = false
      buffering.startAnimating()
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        let urlVC = UrlWSViewController()
        urlVC.view.backgroundColor = .systemBackground
        self.navigationController?.pushViewController(urlVC, animated: true)
      }
    }
    return true
  }
}
