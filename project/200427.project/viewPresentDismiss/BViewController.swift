//
//  BViewController.swift
//  viewPresentDismiss
//
//  Created by 이진욱 on 2020/04/27.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    let buttonB = UIButton()
    let countLabelB = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButtonB()
        createLabelB()
        view.backgroundColor = .darkGray

    }
    func createButtonB() {
        buttonB.setTitle("ButtonB", for: .normal)
        buttonB.frame = CGRect (x: view.center.x - 50, y: view.center.y, width: 200, height: 100)
        buttonB.setTitleColor(.blue, for: .normal)
        buttonB.addTarget(self, action: #selector(dismissView(_:)), for: .touchUpInside)
        view.addSubview(buttonB)
    }
    func createLabelB() {
        countLabelB.frame = CGRect (x: view.center.x - 50, y: view.center.y - 200, width: 200, height: 50)
        countLabelB.textColor = .black
        countLabelB.textAlignment = .center
        view.addSubview(countLabelB)
    }
    @objc func dismissView(_ sender: UIButton) {
        if let AVC = presentingViewController as? ViewController {
            AVC.numCount += 1
            AVC.countLabelA.text = (String(AVC.numCount))
        }
        dismiss(animated: true)
    }
}



