//
//  ViewController.swift
//  CheckFood
//
//  Created by 이진욱 on 2020/05/05.
//  Copyright © 2020 jwlee. All rights reserved.
//
// 음식 수량 체크 후 0이 되면 alert 창으로 수량 알림 각 종류마다 컨테이너 뷰 생성
// 음식 종류는 enum, 수량체크는 dic, 수량 변경은 didset으로 설정
// alert 실행 함수를 만들어 실행 시 작동

import UIKit

class ViewController: UIViewController {
  let meatContainerView = UIView()
  let fishContainerView = UIView()
  let vegetableContainerView = UIView()
  
  let meatLabel = UILabel()
  let fishLabel = UILabel()
  let vegetableLabel = UILabel()
  
  let meatCountLabel = UILabel()
  let fishCountLabel = UILabel()
  let vegetableCountLabel = UILabel()
  
  let meatAddButton = UIButton()
  let fishAddButton = UIButton()
  let vegetableAddButton = UIButton()
  
  var meatCount = 10 {
    didSet {
      meatCountLabel.text = "수량 : " + String(meatCount)
    }
  }
  var fishCount = 10 {
    didSet {
      fishCountLabel.text = "수량 : " + String(fishCount)
    }
  }
  var vegetableCount = 10 {
    didSet {
      vegetableCountLabel.text = "수량 : " + String(vegetableCount)
    }
  }
  
  struct FoodPoint {
    static let inWidth: CGFloat = 100
    static let inHight: CGFloat = 50
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    createMeatContainerView()
    createFishContainerView()
    createVegetableContainerView()
    createMeatLabel()
    createFishLabel()
    createVegetableLabel()
    createMeatCountLabel()
    createFishCountLabel()
    createVegetableCountLabel()
    createMeatAddButton()
    createFishAddButton()
    createVegetableAddButton()
  }
  func createMeatContainerView() {
    meatContainerView.frame =  CGRect (x: 20 , y: 100, width: 350, height: 50)
    view.addSubview(meatContainerView)
  }
  func createFishContainerView() {
    fishContainerView.frame = CGRect (x: 20, y: 200, width: 350, height: 50)
    view.addSubview(fishContainerView)
  }
  func createVegetableContainerView() {
    vegetableContainerView.frame = CGRect (x: 20, y: 300, width: 350, height: 50)
    view.addSubview(vegetableContainerView)
  }
  func createMeatLabel() {
    meatLabel.frame = CGRect (x: 10, y: 0, width: FoodPoint.inWidth, height: FoodPoint.inHight)
    meatLabel.text = "Meat"
    meatLabel.backgroundColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
    meatLabel.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    meatLabel.textAlignment = .center
    meatLabel.layer.cornerRadius = 15
    meatLabel.clipsToBounds = true
    meatContainerView.addSubview(meatLabel)
  }
  func createFishLabel() {
    fishLabel.frame = CGRect (x: 10, y: 0, width: FoodPoint.inWidth, height: FoodPoint.inHight)
    fishLabel.text = "Fish"
    fishLabel.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
    fishLabel.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    fishLabel.textAlignment = .center
    fishLabel.layer.cornerRadius = 15
    fishLabel.clipsToBounds = true
    fishContainerView.addSubview(fishLabel)
  }
  func createVegetableLabel() {
    vegetableLabel.frame = CGRect (x: 10, y: 0, width: FoodPoint.inWidth, height: FoodPoint.inHight)
    vegetableLabel.text = "Vegetable"
    vegetableLabel.backgroundColor = #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)
    vegetableLabel.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    vegetableLabel.textAlignment = .center
    vegetableLabel.layer.cornerRadius = 15
    vegetableLabel.clipsToBounds = true
    vegetableContainerView.addSubview(vegetableLabel)
  }
  func createMeatCountLabel() {
    meatCountLabel.frame = CGRect (x: 130, y: 0, width: FoodPoint.inWidth, height: FoodPoint.inHight)
    meatCountLabel.text = "수량 : " + String(meatCount)
    meatCountLabel.backgroundColor = #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
    meatCountLabel.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    meatCountLabel.textAlignment = .center
    meatCountLabel.layer.cornerRadius = 15
    meatCountLabel.clipsToBounds = true
    meatContainerView.addSubview(meatCountLabel)
  }
  func createFishCountLabel() {
    fishCountLabel.frame = CGRect (x: 130, y: 0, width: FoodPoint.inWidth, height: FoodPoint.inHight)
    fishCountLabel.text = "수량 : " + String(fishCount)
    fishCountLabel.backgroundColor = #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
    fishCountLabel.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    fishCountLabel.textAlignment = .center
    fishCountLabel.layer.cornerRadius = 15
    fishCountLabel.clipsToBounds = true
    fishContainerView.addSubview(fishCountLabel)
  }
  func createVegetableCountLabel() {
    vegetableCountLabel.frame = CGRect (x: 130, y: 0, width: FoodPoint.inWidth, height: FoodPoint.inHight)
    vegetableCountLabel.text = "수량 : " + String(vegetableCount)
    vegetableCountLabel.backgroundColor = #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
    vegetableCountLabel.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    vegetableCountLabel.textAlignment = .center
    vegetableCountLabel.layer.cornerRadius = 15
    vegetableCountLabel.clipsToBounds = true
    vegetableContainerView.addSubview(vegetableCountLabel)
  }
  func createMeatAddButton() {
    meatAddButton.frame = CGRect (x: 250, y: 0, width: FoodPoint.inWidth, height: FoodPoint.inHight)
    meatAddButton.setTitle("사용", for: .normal)
    meatAddButton.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    meatAddButton.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
    meatAddButton.layer.cornerRadius = 15
    meatAddButton.clipsToBounds = true
    meatAddButton.tag = 0
    meatAddButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    meatAddButton.addTarget(self, action: #selector(checkCount), for: .touchUpInside)
    meatContainerView.addSubview(meatAddButton)
  }
  func createFishAddButton() {
    fishAddButton.frame = CGRect (x: 250, y: 0, width: FoodPoint.inWidth, height: FoodPoint.inHight)
    fishAddButton.setTitle("사용", for: .normal)
    fishAddButton.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    fishAddButton.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
    fishAddButton.tag = 1
    fishAddButton.layer.cornerRadius = 15
    fishAddButton.clipsToBounds = true
    fishAddButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    fishAddButton.addTarget(self, action: #selector(checkCount), for: .touchUpInside)
    fishContainerView.addSubview(fishAddButton)
  }
  func createVegetableAddButton() {
    vegetableAddButton.frame = CGRect (x: 250, y: 0, width: FoodPoint.inWidth, height: FoodPoint.inHight)
    vegetableAddButton.setTitle("사용", for: .normal)
    vegetableAddButton.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    vegetableAddButton.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
    vegetableAddButton.tag = 2
    vegetableAddButton.layer.cornerRadius = 15
    vegetableAddButton.clipsToBounds = true
    vegetableAddButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    vegetableAddButton.addTarget(self, action: #selector(checkCount), for: .touchUpInside)
    vegetableContainerView.addSubview(vegetableAddButton)
  }
  @objc func actionButton(_ sender: UIButton) {
    switch sender.tag {
    case 0:
      meatCount -= 1
    case 1:
      fishCount -= 1
    case 2:
      vegetableCount -= 1
    default:
      break
    }
  }
  func actionAlert(title: String, message: String, actions: [UIAlertAction]) {
    let checkAlert = UIAlertController (title: title, message: message, preferredStyle: .alert)
    for action in actions {
      checkAlert.addAction(action)
    }
    present(checkAlert, animated: true)
  }
  @objc func checkCount(_ sender: UIButton) {
    switch sender.tag {
    case 0:
      if meatCount == 0{actionAlert(title: "알람", message: meatLabel.text! + " 수량 부족", actions: [UIAlertAction(title: "확인", style: .destructive)])}
    case 1:
      if fishCount == 0{actionAlert(title: "알람", message: fishLabel.text! + " 수량 부족", actions: [UIAlertAction(title: "확인", style: .destructive)])}
    case 2:
      if vegetableCount == 0 {actionAlert(title: "알람", message: vegetableLabel.text! + " 수량 부족", actions: [UIAlertAction(title: "확인", style: .destructive)])}
    default:
      break
    }
  }
}
