//
//  ViewController.swift
//  pratics
//
//  Created by 이진욱 on 2020/05/27.
//  Copyright © 2020 jwlee. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
  
  let thirdButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    createButton()
    
    view.backgroundColor = .systemBlue
    title = "First"
    let firstBarButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(barButtonPush))
    navigationItem.rightBarButtonItem = firstBarButton
    
  }
  func createButton() {
    thirdButton.frame = CGRect (
      x: view.center.x,
      y: view.center.y,
      width: 100,
      height: 50)
    thirdButton.setTitle("ThirdGo", for: .normal)
    thirdButton.setTitleColor(.white, for: .normal)
    thirdButton.backgroundColor = .systemIndigo
    thirdButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    view.addSubview(thirdButton)
  }
  @objc func actionButton(_ sender: UIButton) {
    let thirdVC = ThirdViewController()
    thirdVC.modalPresentationStyle = .fullScreen
    present(thirdVC, animated: true)
  }
  @objc func barButtonPush(_ sender: UIBarButtonItem) {
    navigationController?.pushViewController(SecondViewController(), animated: true)
  }
  
}

