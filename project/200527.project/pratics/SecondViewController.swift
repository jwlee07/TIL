//
//  SecondViewController.swift
//  pratics
//
//  Created by 이진욱 on 2020/05/27.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .systemYellow
      title = "Second"
      
      let secondBarButton = UIBarButtonItem (title: "Next", style: .plain, target: self, action: #selector(didBarbuttonTouch))
      
      navigationItem.rightBarButtonItem = secondBarButton
    }
  @objc func didBarbuttonTouch(_ sender: UIBarButtonItem) {
    navigationController?.pushViewController(ThirdViewController(), animated: true)
  }
}
