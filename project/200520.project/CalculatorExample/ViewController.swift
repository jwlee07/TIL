//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet weak var labelDisplay: UILabel!
  
  var formatter = NumberFormatter()
  var display = "0"
  var firstNum = 0
  var secondNum = 0
  var equalsNum = 0
  var symbolArr: [String] = []
  
  var symbol = "+"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 3
  }
  
  // 입력받은 숫자 displayLabel 출력
  @IBAction func displayNumberButtonAction(_ sender: UIButton) {
    if labelDisplay.text!.count < 13 {
      if labelDisplay.text == "0" {
        display = (sender.titleLabel?.text)!
      } else {
        display += (sender.titleLabel?.text)!
      }
      if let displayNumber = formatter.string(from: Int(display)! as NSNumber) {
        labelDisplay.text = displayNumber
      }
    }
  }
  
  // 연산기호 버튼 클릭 시 실행
  @IBAction func symbolButoonAction(_ sender: UIButton) {
    symbol = (sender.titleLabel?.text)!
  
    if firstNum == 0 {
      if let firstNumCheck = Int(display) {
        firstNum = firstNumCheck
      }
    } else {
      if let secondNumCheck = Int(display) {
        secondNum = secondNumCheck
      }
    }
    
    if symbol != "=" {
      symbolArr.insert(symbol, at: 0)
    }
    
    print ("firstNum : ", firstNum)
    print ("secondNum : ", secondNum)
    print ("equalsNum : ", equalsNum)
    print ("symbol : ", symbol)
    print ("symbolArr[0] : ", symbolArr[0])
    
    calAction()
    
    if symbolArr.count > 0 {
      if symbol == "=" {
        switch symbolArr[0] {
        case "+":
          equalsNum += secondNum
        case "-":
          equalsNum -= secondNum
        case "×":
          equalsNum *= secondNum
        case "÷":
          equalsNum /= secondNum
        default:
          break
        }
        symbolArr.remove(at: 0)
        if let displayNumber = formatter.string(from: Int(equalsNum) as NSNumber) {
          labelDisplay.text = displayNumber
        }
      }
    }
  }
  
  // 연산 함수
  @IBAction func calAction() {
      
    switch symbol {
    case "+":
      firstNum += secondNum
      equalsNum = firstNum
    case "-":
      firstNum -= secondNum
      equalsNum = firstNum
    case "×":
      if secondNum == 0 {
      firstNum *= (secondNum + 1)
      } else {
        firstNum *= secondNum
      }
      equalsNum = firstNum
    case "÷":
      if secondNum == 0 {
        firstNum /= (secondNum + 1)
      } else {
        firstNum /= secondNum
      }
      equalsNum = firstNum
    default:
      break
    }
    if let displayNumber = formatter.string(from: Int(firstNum) as NSNumber) {
      labelDisplay.text = displayNumber
    }
    display = ""
  }
  
  // AC 실행
  @IBAction func resetButtonAction(_ sender: UIButton) {
    display = "0"
    labelDisplay.text = display
    equalsNum = 0
    firstNum = 0
    secondNum = 0
  }
}

/*
 print ("firstNum : ", firstNum)
 print ("secondNum : ", secondNum)
 print ("equalsNum : ", equalsNum)
 print ("symbol : ", symbol)
 print ("symbolArr[0] : ", symbolArr[0])
*/
 

