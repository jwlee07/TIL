//
//  BViewController.swift
//  ABC
//
//  Created by 이진욱 on 2020/04/27.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    let backToA = UIButton()
    let goToC = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        createGoToC()
        createBackToA()

    }
    func createBackToA() {
        backToA.setTitle("BackToA", for: .normal)
        backToA.setTitleColor(.red, for: .normal)
        backToA.frame = CGRect (x: view.center.x - 100, y: view.center.y, width: 100, height: 50)
        backToA.sizeToFit()
        backToA.addTarget(self, action: #selector(backA(_:)), for: .touchUpInside)
        view.addSubview(backToA)
    }
    func createGoToC() {
        goToC.setTitle("GoToC", for: .normal)
        goToC.setTitleColor(.green, for: .normal)
        goToC.frame = CGRect (x: view.center.x + 100, y: view.center.y, width: 100, height: 50)
        goToC.sizeToFit()
        goToC.addTarget(self, action: #selector(goC(_:)), for: .touchUpInside)
        view.addSubview(goToC)
    }
    @objc func backA (_ sender: UIButton) {
        dismiss(animated: true)
    }
    @objc func goC (_ sender: UIButton) {
        let changeC = CViewController()
        present(changeC, animated: true)
    }
}
