//
//  ViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.

import UIKit

final class CreateNewWSViewController: UIViewController {
  
  let createNewButton: UIButton = {
    let button = UIButton()
    button.setTitle("Create New WorkSpace", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.addTarget(self, action: #selector(actionCreateButton), for: .touchUpInside)
    return button
  }()
  
  let margin: CGFloat = 100
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    setupCreateButton()
  }
  
  func setupCreateButton() {
    view.addSubview(createNewButton)
    createNewButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      createNewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.midY - (margin / 2)),
      createNewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.midX - margin),
      createNewButton.heightAnchor.constraint(equalToConstant: 100)
      ])
  }
  
  @objc func actionCreateButton(_ sender: UIButton) {
    let nameVC = NameWSViewController()
    let navigationNameVC = UINavigationController(rootViewController: nameVC)
    navigationNameVC.modalPresentationStyle = .fullScreen
    present(navigationNameVC, animated: true)
  }
}
