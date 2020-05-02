//
//  ViewController.swift
//  presentDismissTest
//
//  Created by 이진욱 on 2020/05/02.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var presentButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print ("First viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print ("First viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print ("First viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("First viewDidDisappear")
    }
    
    func createButton() {
        presentButton.frame = CGRect (x: view.center.x - 50, y: view.center.y, width: 100, height: 50)
        presentButton.setTitle("Present", for: .normal)
        presentButton.setTitleColor(.blue, for: .normal)
        presentButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        view.addSubview(presentButton)
    }
    @objc func actionButton(_ sender: UIButton) {
        let presentAlert = UIAlertController(title: "알람", message: "SecondView로 이동하시겠습니까 ?", preferredStyle: .alert)
        let presentOk = UIAlertAction(title: "네", style: .default) {_ in
            let secondVC = SecondViewController()
            secondVC.modalPresentationStyle = .pageSheet
            self.present(secondVC, animated: true)
        }
        let presentCancle = UIAlertAction(title: "아니오", style: .destructive)
        presentAlert.addAction(presentOk)
        presentAlert.addAction(presentCancle)
        present(presentAlert, animated: true)
    }
}

