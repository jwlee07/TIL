//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.


import UIKit

final class ViewController: UIViewController {

  @IBOutlet weak var labelDisplay: UILabel!
  
  var labelDisplayCheck = "0"
  var equleResult = 0
  var first = 0
  var second = 0
  var operationSign: String? = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    labelDisplay.text = "0"
    
  }
  
  // 숫자버튼 선택 시 라벨에 표시
  @IBAction func buttonCheck(_ sender: UIButton) {
    if labelDisplay.text == "0" {
      labelDisplayCheck = (sender.titleLabel?.text)!
    } else {
      labelDisplayCheck += (sender.titleLabel?.text)!
    }
    labelDisplay.text = labelDisplayCheck
  }
  
  // 연산 버튼 클릭 시 실행
  @IBAction func operationButton(_ sender: UIButton) {
    if labelDisplay.text != "0" {
      operationSign = sender.titleLabel?.text
      operation()
      if operationSign! == "=" {
        labelDisplay.text = String(first)
          first = 0
      }
    } else {
      operationSign = sender.titleLabel?.text
    }
    labelDisplayCheck = ""
  }
  
  // 연산 함수
  func operation() {
    if first == 0 {
      first = Int(labelDisplayCheck)!
    } else {
      second = Int(labelDisplayCheck)!
      if operationSign! == "+" {
        first += second
      } else if operationSign! == "-" {
        first -= second
      } else if operationSign! == "×" {
        first *= second
      } else if operationSign! == "÷" {
        first /= second
      }
      labelDisplay.text = String(first)
      }
    }
  
  
  // AC버튼 선택 시 라벨 0으로 초기화
  @IBAction func resetButton(_ sender: UIButton) {
    if sender.titleLabel?.text == "AC" {
      labelDisplayCheck = "0"
      labelDisplay.text = labelDisplayCheck
      first = 0
      second = 0
      operationSign = nil
    }
  }
}
