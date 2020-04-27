//
//  CViewController.swift
//  ABC
//
//  Created by 이진욱 on 2020/04/27.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class CViewController: UIViewController {
    let backToB = UIButton()
    let backToA = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        createbackToA()
        createBackToB()
        
    }
    func createbackToA() {
        backToA.setTitle("backToA", for: .normal)
        backToA.setTitleColor(.red, for: .normal)
        backToA.frame = CGRect (x: view.center.x - 100, y: view.center.y, width: 100, height: 50)
        backToA.addTarget(self, action: #selector(backA(_:)), for: .touchUpInside)
        view.addSubview(backToA)
    }
    func createBackToB() {
        backToB.setTitle("BackToB", for: .normal)
        backToB.setTitleColor(.blue, for: .normal)
        backToB.frame = CGRect (x: view.center.x + 100, y: view.center.y, width: 100, height: 50)
        backToB.addTarget(self, action: #selector((backB(_:))), for: .touchUpInside)
        view.addSubview(backToB)
    }
    @objc func backA(_ sender: UIButton) {
        presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    @objc func backB(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
