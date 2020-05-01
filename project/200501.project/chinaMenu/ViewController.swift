//
//  ViewController.swift
//  chinaMenu
//
//  Created by 이진욱 on 2020/05/01.
//  Copyright © 2020 jwlee. All rights reserved.
//
// 1. 완료
// 2. 완료
// 3. 완료
// 4. 완료
//
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var blackNoodleCount: UILabel!
    @IBOutlet weak var redNoodleCount: UILabel!
    @IBOutlet weak var sourPorkCount: UILabel!
    @IBOutlet weak var blackNoodelButton: UIButton!
    @IBOutlet weak var redNoodleButton: UIButton!
    @IBOutlet weak var sourPorkButton: UIButton!
    
    let readyMoneyTitle = UILabel()
    let readyMoneyCheck = UILabel()
    let payMoneyTitle = UILabel()
    let payMoneyCheck = UILabel()
    let resetButton = UIButton()
    let payButton = UIButton()
    
    var countCheckblack = 0
    var countCheckred = 0
    var countChecksourPork = 0
    var countReadyMoney = 70000
    var countPayMoney = 0
    var blackNoodlePrice = 5000
    var redNoodlePrice = 6000
    var sourPorkPrice = 12000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createReadyMoneyTitle()
        createReadyMoneyCheck()
        createResetButton()
        createPayMoneyTitle()
        createPayMoneyCheck()
        createPayButton()
        
        blackNoodelButton.addTarget(self, action: #selector(calPayMoney), for: .touchUpInside)
        redNoodleButton.addTarget(self, action: #selector(calPayMoney), for: .touchUpInside)
        sourPorkButton.addTarget(self, action: #selector(calPayMoney), for: .touchUpInside)
        
        blackNoodelButton.addTarget(self, action: #selector(calReadyMoney), for: .touchUpInside)
        redNoodleButton.addTarget(self, action: #selector(calReadyMoney), for: .touchUpInside)
        sourPorkButton.addTarget(self, action: #selector(calReadyMoney), for: .touchUpInside)
        
    }
    func createReadyMoneyTitle() {
        readyMoneyTitle.frame = CGRect (x: 40, y: view.center.y - 100, width:80, height: 40)
        readyMoneyTitle.text = "소지금"
        readyMoneyTitle.backgroundColor = .green
        readyMoneyTitle.textAlignment = .center
        view.addSubview(readyMoneyTitle)
    }
    func createReadyMoneyCheck() {
        readyMoneyCheck.frame = CGRect (x: 130, y: view.center.y - 100, width:140, height: 40)
        readyMoneyCheck.text = "70000원"
        readyMoneyCheck.backgroundColor = .green
        readyMoneyCheck.textAlignment = .right
        view.addSubview(readyMoneyCheck)
    }
    func createResetButton() {
        resetButton.frame = CGRect (x: 300, y: view.center.y - 100, width: 80, height: 40)
        resetButton.setTitle("초기화", for: .normal)
        resetButton.setTitleColor(.white, for: .normal)
        resetButton.backgroundColor = .black
        resetButton.addTarget(self, action: #selector(actionReset), for: .touchUpInside)
        view.addSubview(resetButton)
    }
    func createPayMoneyTitle() {
        payMoneyTitle.frame = CGRect (x: 40, y: view.center.y - 50, width:80, height: 40)
        payMoneyTitle.text = "결제금액"
        payMoneyTitle.backgroundColor = .orange
        payMoneyTitle.textAlignment = .center
        view.addSubview(payMoneyTitle)
    }
    func createPayMoneyCheck() {
        payMoneyCheck.frame = CGRect (x: 130, y: view.center.y - 50, width:140, height: 40)
        payMoneyCheck.text = "원"
        payMoneyCheck.backgroundColor = .orange
        payMoneyCheck.textAlignment = .right
        view.addSubview(payMoneyCheck)
    }
    func createPayButton() {
        payButton.frame = CGRect (x: 300, y: view.center.y - 50, width: 80, height: 40)
        payButton.setTitle("결제", for: .normal)
        payButton.setTitleColor(.white, for: .normal)
        payButton.backgroundColor = .black
        payButton.addTarget(self, action: #selector(actionPayAlert), for: .touchUpInside)
        view.addSubview(payButton)
    }
    @objc func calPayMoney(_ sender: UIButton) {
        switch sender {
        case blackNoodelButton:
            countPayMoney += blackNoodlePrice
            payMoneyCheck.text = String(countPayMoney) + "원"
        case redNoodleButton:
            countPayMoney += redNoodlePrice
            payMoneyCheck.text = String(countPayMoney) + "원"
        case sourPorkButton:
            countPayMoney += sourPorkPrice
            payMoneyCheck.text = String(countPayMoney) + "원"
        default:
            break
        }
    }
    @objc func calReadyMoney(_ sender: UIButton) {
        switch sender {
        case blackNoodelButton:
            countReadyMoney -= blackNoodlePrice
        case redNoodleButton:
            countReadyMoney -= redNoodlePrice
        case sourPorkButton:
            countReadyMoney -= sourPorkPrice
        default:
            break
        }
    }
    @IBAction func orderCheck(_ sender: UIButton) {
        switch sender {
        case blackNoodelButton:
            countCheckblack += 1
            blackNoodleCount.text = String(countCheckblack)
        case redNoodleButton:
            countCheckred += 1
            redNoodleCount.text = String(countCheckred)
        case sourPorkButton:
            countChecksourPork += 1
            sourPorkCount.text = String(countChecksourPork)
        default:
            break
        }
    }
    @objc func actionReset(_ sender: UIButton) {
        blackNoodleCount.text = "0"
        redNoodleCount.text = "0"
        sourPorkCount.text = "0"
        payMoneyCheck.text = "원"
        readyMoneyCheck.text = "70000원"
        countReadyMoney = 70000
        countPayMoney = 0
        countCheckblack = 0
        countCheckred = 0
        countChecksourPork = 0
        
    }
    @objc func actionPayAlert(_ sender: UIButton) {
        if self.countReadyMoney > self.countPayMoney {
            let okPayAlert = UIAlertController(title: "총 결제금액은 \(payMoneyCheck.text!) 입니다.", message: .none, preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default) {_ in
                self.countReadyMoney - self.countPayMoney
                self.readyMoneyCheck.text = String(self.countReadyMoney) + "원"
                self.blackNoodleCount.text = "0"
                self.redNoodleCount.text = "0"
                self.sourPorkCount.text = "0"
                self.payMoneyCheck.text = "원"
                self.countCheckblack = 0
                self.countCheckred = 0
                self.countChecksourPork = 0
                self.countPayMoney = 0
            }
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            okPayAlert.addAction(ok)
            okPayAlert.addAction(cancel)
            present(okPayAlert, animated: true)
        } else {
            let noPayAlert = UIAlertController(title: "소지금액이 부족합니다.", message: .none, preferredStyle: .alert)
            let no = UIAlertAction(title: "확인", style: .default)
            noPayAlert.addAction(no)
            present(noPayAlert, animated: true)
        }
    }
}

