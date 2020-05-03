//
//  MenuViewController.swift
//  paymentView
//
//  Created by 이진욱 on 2020/05/03.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
  let titleLabel = UILabel()
  let gimbapLabel = UILabel()
  let noodelLabel = UILabel()
  let ttakbogiLabel = UILabel()
  
  let gimbapLabelPrice = UILabel()
  let noodelLabelPrice = UILabel()
  let ttakbogiLabelPrice = UILabel()
  
  let gimbapLabelCount = UILabel()
  let noodelLabelCount = UILabel()
  let ttakbogiLabelCount = UILabel()
  let payLabelCount = UILabel()
  
  let gimbapButton = UIButton()
  let noodelButton = UIButton()
  let ttakbogiButton = UIButton()
  let resetButton = UIButton()
  let payButton = UIButton()
  
  let gimbapPrice = 2000
  let noodelPrice = 3000
  let ttakbogiPrice = 3500
  
  var gimbapCount = 0
  var noodelCount = 0
  var ttakbogiCount = 0
  var payCount = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)
    createLabel()
    createGimbapLabel()
    createNoodelLabel()
    createTtakbogiLabel()
    createGimbapLabelPrice()
    createNoodelLabelPrice()
    createTtakbogiLabelPrice()
    createGimbapLabelCount()
    createNoodelLabelCount()
    createTtakbogiLabelCount()
    createGimbapButton()
    createNoodelButton()
    createTtakbogiButton()
    createPayLabelCount()
    createResetButton()
    createPayButton()
  }
  func createLabel() {
    titleLabel.frame = CGRect (x: view.center.x - 100, y: 75, width: 200, height: 50)
    titleLabel.text = "산들김밥"
    titleLabel.textAlignment = .center
    titleLabel.textColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
    titleLabel.backgroundColor = .systemYellow
    titleLabel.layer.cornerRadius = 15
    titleLabel.clipsToBounds = true
    view.addSubview(titleLabel)
  }
  func createGimbapLabel() {
    gimbapLabel.frame = CGRect (x: 20, y: 150, width: 100, height: 50)
    gimbapLabel.text = "김밥"
    gimbapLabel.textAlignment = .center
    gimbapLabel.textColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
    gimbapLabel.backgroundColor = .systemIndigo
    gimbapLabel.layer.cornerRadius = 15
    gimbapLabel.clipsToBounds = true
    view.addSubview(gimbapLabel)
  }
  func createNoodelLabel() {
    noodelLabel.frame = CGRect (x: 20, y: 250, width: 100, height: 50)
    noodelLabel.text = "라면"
    noodelLabel.textAlignment = .center
    noodelLabel.textColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
    noodelLabel.backgroundColor = .systemIndigo
    noodelLabel.layer.cornerRadius = 15
    noodelLabel.clipsToBounds = true
    view.addSubview(noodelLabel)
  }
  func createTtakbogiLabel() {
    ttakbogiLabel.frame = CGRect (x: 20, y: 350, width: 100, height: 50)
    ttakbogiLabel.text = "떡볶이"
    ttakbogiLabel.textAlignment = .center
    ttakbogiLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    ttakbogiLabel.backgroundColor = .systemIndigo
    ttakbogiLabel.layer.cornerRadius = 15
    ttakbogiLabel.clipsToBounds = true
    view.addSubview(ttakbogiLabel)
  }
  func createGimbapLabelPrice() {
    gimbapLabelPrice.frame = CGRect (x: 140, y: 150, width: 100, height: 50)
    gimbapLabelPrice.text = String(gimbapPrice) + "원"
    gimbapLabelPrice.textAlignment = .center
    gimbapLabelPrice.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    gimbapLabelPrice.backgroundColor = .systemIndigo
    gimbapLabelPrice.layer.cornerRadius = 15
    gimbapLabelPrice.clipsToBounds = true
    view.addSubview(gimbapLabelPrice)
  }
  func createNoodelLabelPrice() {
    noodelLabelPrice.frame = CGRect (x: 140, y: 250, width: 100, height: 50)
    noodelLabelPrice.text = String(noodelPrice) + "원"
    noodelLabelPrice.textAlignment = .center
    noodelLabelPrice.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    noodelLabelPrice.backgroundColor = .systemIndigo
    noodelLabelPrice.layer.cornerRadius = 15
    noodelLabelPrice.clipsToBounds = true
    view.addSubview(noodelLabelPrice)
  }
  func createTtakbogiLabelPrice() {
    ttakbogiLabelPrice.frame = CGRect (x: 140, y: 350, width: 100, height: 50)
    ttakbogiLabelPrice.text = String(ttakbogiPrice) + "원"
    ttakbogiLabelPrice.textAlignment = .center
    ttakbogiLabelPrice.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    ttakbogiLabelPrice.backgroundColor = .systemIndigo
    ttakbogiLabelPrice.layer.cornerRadius = 15
    ttakbogiLabelPrice.clipsToBounds = true
    view.addSubview(ttakbogiLabelPrice)
  }
  func createGimbapLabelCount() {
    gimbapLabelCount.frame = CGRect (x: 260, y: 150, width: 30, height: 50)
    gimbapLabelCount.text = String(gimbapCount)
    gimbapLabelCount.textAlignment = .center
    gimbapLabelCount.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    gimbapLabelCount.backgroundColor = .systemIndigo
    gimbapLabelCount.layer.cornerRadius = 15
    gimbapLabelCount.clipsToBounds = true
    view.addSubview(gimbapLabelCount)
  }
  func createNoodelLabelCount() {
    noodelLabelCount.frame = CGRect (x: 260, y: 250, width: 30, height: 50)
    noodelLabelCount.text = String(noodelCount)
    noodelLabelCount.textAlignment = .center
    noodelLabelCount.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    noodelLabelCount.backgroundColor = .systemIndigo
    noodelLabelCount.layer.cornerRadius = 15
    noodelLabelCount.clipsToBounds = true
    view.addSubview(noodelLabelCount)
  }
  func createTtakbogiLabelCount() {
    ttakbogiLabelCount.frame = CGRect (x: 260, y: 350, width: 30, height: 50)
    ttakbogiLabelCount.text = String(ttakbogiCount)
    ttakbogiLabelCount.textAlignment = .center
    ttakbogiLabelCount.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    ttakbogiLabelCount.backgroundColor = .systemIndigo
    ttakbogiLabelCount.layer.cornerRadius = 15
    ttakbogiLabelCount.clipsToBounds = true
    view.addSubview(ttakbogiLabelCount)
  }
  func createGimbapButton() {
    gimbapButton.frame = CGRect (x: 315, y: 150, width: 75, height: 50)
    gimbapButton.setTitle("추가", for: .normal)
    gimbapButton.backgroundColor = .systemBlue
    gimbapButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    gimbapButton.layer.cornerRadius = 15
    gimbapButton.clipsToBounds = true
    gimbapButton.addTarget(self, action: #selector(menuCount), for: .touchUpInside)
    view.addSubview(gimbapButton)
  }
  func createNoodelButton() {
    noodelButton.frame = CGRect (x: 315, y: 250, width: 75, height: 50)
    noodelButton.setTitle("추가", for: .normal)
    noodelButton.backgroundColor = .systemBlue
    noodelButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    noodelButton.layer.cornerRadius = 15
    noodelButton.clipsToBounds = true
    noodelButton.addTarget(self, action: #selector(menuCount), for: .touchUpInside)
    view.addSubview(noodelButton)
  }
  func createTtakbogiButton() {
    ttakbogiButton.frame = CGRect (x: 315, y: 350, width: 75, height: 50)
    ttakbogiButton.setTitle("추가", for: .normal)
    ttakbogiButton.backgroundColor = .systemBlue
    ttakbogiButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    ttakbogiButton.layer.cornerRadius = 15
    ttakbogiButton.clipsToBounds = true
    ttakbogiButton.addTarget(self, action: #selector(menuCount), for: .touchUpInside)
    view.addSubview(ttakbogiButton)
  }
  func createResetButton() {
    resetButton.frame = CGRect (x: 20, y: 450, width: 100, height: 50)
    resetButton.setTitle("초기화", for: .normal)
    resetButton.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1) ,for: .normal)
    resetButton.backgroundColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
    resetButton.layer.cornerRadius = 15
    resetButton.clipsToBounds = true
    resetButton.addTarget(self, action: #selector(actionResetButton), for: .touchUpInside)
    view.addSubview(resetButton)
  }
  func createPayLabelCount() {
    payLabelCount.frame = CGRect (x: 140, y: 450, width: 150, height: 50)
    payLabelCount.text = String(payCount) + "원   "
    payLabelCount.textAlignment = .right
    payLabelCount.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    payLabelCount.backgroundColor = .systemIndigo
    payLabelCount.layer.cornerRadius = 15
    payLabelCount.clipsToBounds = true
    view.addSubview(payLabelCount)
  }
  func createPayButton() {
    payButton.frame = CGRect (x: 315, y: 450, width: 75, height: 50)
    payButton.setTitle("결제", for: .normal)
    payButton.backgroundColor = .systemBlue
    payButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    payButton.layer.cornerRadius = 15
    payButton.clipsToBounds = true
    payButton.addTarget(self, action: #selector(actionPay), for: .touchUpInside)
    view.addSubview(payButton)
  }
  @objc func actionResetButton(_ sender: Any) {
    gimbapCount = 0
    noodelCount = 0
    ttakbogiCount = 0
    payCount = 0
    
    gimbapLabelCount.text = String(gimbapCount)
    noodelLabelCount.text = String(noodelCount)
    ttakbogiLabelCount.text = String(ttakbogiCount)
    payLabelCount.text = String(payCount) + "원"
  }
  @objc func menuCount(_ sender: UIButton) {
    switch sender {
    case gimbapButton:
      gimbapCount += 1
      payCount += gimbapPrice
      gimbapLabelCount.text = String(gimbapCount)
      payLabelCount.text = String(payCount) + "원"
    case noodelButton:
      noodelCount += 1
      payCount += noodelPrice
      noodelLabelCount.text = String(noodelCount)
      payLabelCount.text = String(payCount) + "원"
    case ttakbogiButton:
      ttakbogiCount += 1
      payCount += ttakbogiPrice
      ttakbogiLabelCount.text = String(ttakbogiCount)
      payLabelCount.text = String(payCount) + "원"
    default:
      break
    }
  }
  @objc func actionPay(_ sender: UIButton) {
    let payAlert = UIAlertController(title: "결제 하시겠습니까 ?", message: "결제금액 : \(payCount)원", preferredStyle: .alert)
    let payAlertOk = UIAlertAction(title: "네", style: .default, handler: payOk)
    let payAlertCancel = UIAlertAction(title: "아니오", style: .destructive, handler: payCancel)
    payAlert.addAction(payAlertOk)
    payAlert.addAction(payAlertCancel)
    present(payAlert, animated: true)
  }
  @objc func payOk(_ sender: UIAlertAction) {
    let payOkAlert = UIAlertController(title: "결제완료 되었습니다.", message: nil, preferredStyle: .alert)
    let payOkAlertOk = UIAlertAction(title: "확인", style: .default, handler: actionResetButton)
    payOkAlert.addAction(payOkAlertOk)
    present (payOkAlert, animated: true)
    
  }
  @objc func payCancel(_ sender: UIAlertAction) {
    let payCancleAlert = UIAlertController(title: "결제취소 되었습니다.", message: nil, preferredStyle: .alert)
    let payCancleAlertOk = UIAlertAction(title: "확인", style: .default)
    payCancleAlert.addAction(payCancleAlertOk)
    present (payCancleAlert, animated: true)
  }
}
