//
//  AfterLoginViewController.swift
//  FastCampusLogin
//
//  Created by 이진욱 on 2020/05/16.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class AfterLoginViewController: UIViewController {
    let dismissButton = UIButton()

    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
      createDismissButton()
      

    }
  func createDismissButton() {
    dismissButton.frame = CGRect (
      x: view.center.x - 50,
      y: view.center.y,
      width: 100,
      height: 50)
    dismissButton.setTitle("Sign Out", for: .normal)
    dismissButton.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
    dismissButton.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    dismissButton.addTarget(self, action: #selector(actionDismissButton), for: .touchUpInside)
    view.addSubview(dismissButton)
  }
  @objc func actionDismissButton(_ sender: UIButton) {
    dismiss(animated: true)
  }
}
