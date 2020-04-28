//
//  ViewController.swift
//  alertCount
//
//  Created by 이진욱 on 2020/04/28.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Button, Label
    let actionButton = UIButton()
    var countLabel = UILabel()
    var numCount = 0 {
        didSet {
            countLabel.text = String(numCount)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        createLabel()
    }
    
    // Create
    func createButton() {
        actionButton.frame = CGRect (x: view.center.x - 50, y: view.center.y, width: 100, height: 100)
        actionButton.setTitle("CountSet", for: .normal)
        actionButton.setTitleColor(.blue, for: .normal)
        actionButton.addTarget(self, action: #selector(actionButoon(_:)), for: .touchUpInside)
        view.addSubview(actionButton)
    }
    func createLabel() {
        countLabel.frame = CGRect (x: view.center.x, y: view.center.y - 200, width: 100, height: 100)
        countLabel.text = "0"
        view.addSubview(countLabel)
    }
    
    // Action
    @objc func actionButoon(_ action: UIButton) {
        let countSetAlert = UIAlertController (title: "Choice", message: nil, preferredStyle: .alert)
        countSetAlert.addTextField {$0.placeholder = "InPut Intger"}
        let countPlus = UIAlertAction(title: "Add", style: .default) {_ in
            var numAdd = 0
            if let numInCheck = countSetAlert.textFields?.first,
                let numInValueString = numInCheck.text,
                let numInValueInt = Int(numInValueString) {
                numAdd = numInValueInt
                self.numCount += numAdd
            } else {
            self.numCount += 1
            }
        }
        let countReset = UIAlertAction(title: "Reset", style: .destructive) {_ in
            self.numCount = 0
        }
        let countCancel = UIAlertAction(title: "Cancel", style: .cancel)
        for action in [countPlus, countReset, countCancel] {
            countSetAlert.addAction(action)
        }
        present(countSetAlert, animated: true)
    }
}

