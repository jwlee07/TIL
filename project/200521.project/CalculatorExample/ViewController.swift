//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet weak var displayLabel: UILabel!
  var firstNum = "0"
  var displayResult: Double = 0 {
    didSet {
      displayLabel.text = fomatter.string(from: displayResult as NSNumber)
    }
  }
  let fomatter = NumberFormatter()
  var symbol: String?
  var secondNum: String = "0"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fomatter.numberStyle = .decimal
    fomatter.minimumFractionDigits = 0
    fomatter.maximumFractionDigits = 3
  }
  @IBAction func numberButtonAction(_ sender: UIButton) {
    if firstNum.count < 13 , secondNum.count < 13 {
      if symbol == nil || symbol == "="{
        firstNum += (sender.titleLabel?.text)!
        displayResult = Double(firstNum)!
      } else {
        secondNum += (sender.titleLabel?.text)!
        displayLabel.text = fomatter.string(from: Double(secondNum)! as NSNumber)
      }
    }
  }
  @IBAction func opertaionButtonAction(_ sender: UIButton) {
    
    if symbol != nil, symbol != "=" {
      switch symbol {
      case "+":
       displayResult += Double(secondNum)!
      case "-":
       displayResult -= Double(secondNum)!
      case "×":
        if secondNum == "0" {
          displayResult *= Double(secondNum + "1")!
        } else {
          displayResult *= Double(secondNum)!
        }
      case "÷":
        if secondNum == "0" {
          displayResult /= Double(secondNum + "1")!
        } else {
          displayResult /= Double(secondNum)!
        }
      default:
        break
      }
      secondNum = "0"
    } else {
      firstNum = "0"
      secondNum = "0"
    }
    symbol = (sender.titleLabel?.text)!
  }
  @IBAction func resetButtonAction(_ sender: UIButton) {
    displayResult = 0
    firstNum = "0"
    secondNum = "0"
    symbol = nil
  }
}
