//
//  SecondViewController.swift
//  presentDismissTest
//
//  Created by 이진욱 on 2020/05/02.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var dismissButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        createDismissButton()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        print ("Second viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print ("Second viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print ("Second viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("Second viewDidDisappear")
    }
    
    func createDismissButton() {
        dismissButton.frame = CGRect (x: view.center.x - 50, y: view.center.y, width: 100, height: 50)
        dismissButton.setTitle("DisMiss", for: .normal)
        dismissButton.setTitleColor(.blue, for: .normal)
        dismissButton.addTarget(self, action: #selector(actionDismissButton), for: .touchUpInside)
        view.addSubview(dismissButton)
    }
    @objc func actionDismissButton(_ sender: UIButton) {
        let dismissAlert = UIAlertController(title: "알람", message: "이전화면으로 돌아가시겠습니까?", preferredStyle: .alert)
        let dismissOk = UIAlertAction(title: "네", style: .default){_ in
            if let masterVC = self.presentingViewController as? ViewController {
                masterVC.presentButton.setTitleColor(.red, for: .normal)
                self.dismiss(animated: true)
            }
        }
        let dismissCancle = UIAlertAction(title: "아니오", style: .destructive)
        dismissAlert.addAction(dismissOk)
        dismissAlert.addAction(dismissCancle)
        present(dismissAlert, animated: true)
    }
}
