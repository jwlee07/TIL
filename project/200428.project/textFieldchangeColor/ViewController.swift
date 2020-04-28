//
//  ViewController.swift
//  textFieldchangeColor
//
//  Created by 이진욱 on 2020/04/28.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var printLabel = UILabel()
    let inPutText = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        createLabel()
        createText()
    }
    override func viewWillAppear(_ animated: Bool) {
        inPutText.becomeFirstResponder()
    }
    func createLabel() {
        printLabel.frame = CGRect (x: 50, y: 100, width: 300, height: 75)
        printLabel.text = " "
        printLabel.backgroundColor = .lightGray
        view.addSubview(printLabel)
    }
    func createText() {
        inPutText.frame = CGRect (x: 50, y: 250, width: 300, height: 50)
        inPutText.placeholder = "입력하시오."
        inPutText.borderStyle = .roundedRect
        inPutText.addTarget(self, action: #selector(beginChangeLabel(_:)), for: .editingDidBegin)
        inPutText.addTarget(self, action: #selector(editingChangeLabel(_:)), for: .editingChanged)
        inPutText.addTarget(self, action: #selector(exitChangeLabel(_:)), for: .editingDidEndOnExit)
        view.addSubview(inPutText)
    }
    @objc func beginChangeLabel(_ sender: UITextField) {
        printLabel.font = .boldSystemFont(ofSize: 40)
    }
    @objc func editingChangeLabel(_ sender: UITextField) {
        if let textIn = sender.text {
            if textIn.count <= 10 {
                printLabel.text = t
                extIn
                printLabel.textColor = .blue
            } else {
                let warrning = UIAlertController (title: "경고", message: "10개 이상 입력 X", preferredStyle: .alert)
                let warrningCancel = UIAlertAction (title: "재입력", style: .cancel) {_ in
                    self.inPutText.text = " "
                    self.printLabel.text = " "
                }
                warrning.addAction(warrningCancel)
                present(warrning, animated: true)
            }
        }
    }
    @objc func exitChangeLabel(_ sender: UITextField) {
        printLabel.textColor = .red
        printLabel.font = .boldSystemFont(ofSize: 20)
        printLabel.resignFirstResponder()
    }
}

