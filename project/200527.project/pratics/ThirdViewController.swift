//
//  ThirdViewController.swift
//  pratics
//
//  Created by 이진욱 on 2020/05/27.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
  
  let firstButton = UIButton()
  

  override func viewDidLoad() {
      super.viewDidLoad()
      createFirstButton()
      title = "Third"
      view.backgroundColor = .systemIndigo
  }
  func createFirstButton() {
    firstButton.frame = CGRect (
      x: view.center.x,
      y: view.center.y,
      width: 100,
      height: 50)
    firstButton.setTitle("FirstGO", for: .normal)
    firstButton.setTitleColor(.white, for: .normal)
    firstButton.backgroundColor = .systemBlue
    firstButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    view.addSubview(firstButton)
    
  }
  @objc func actionButton(_ sender: UIButton) {
    let firstVC = ViewController()
    firstVC.modalPresentationStyle = .fullScreen
    present(firstVC, animated: true)
  }
}
