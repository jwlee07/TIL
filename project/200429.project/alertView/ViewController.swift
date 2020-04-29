//
//  ViewController.swift
//  alertView
//
//  Created by 이진욱 on 2020/04/29.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let alertButton = UIButton()
    var viewLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        createLabel()
        
    }
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        self.view = view
    }
    func createButton() {
        alertButton.frame = CGRect (x: view.center.x - 50, y: view.center.y, width: 100, height: 50)
        alertButton.setTitle("Alert", for: .normal)
        alertButton.setTitleColor(.blue, for: .normal)
        alertButton.addTarget(self, action: #selector(actionButton(_:)), for: .touchUpInside)
        view.addSubview(alertButton)
    }
    func createLabel() {
        viewLabel.frame = CGRect (x: view.center.x - 150, y: view.center.y - 200, width: 300, height: 50)
        viewLabel.text = "default"
        viewLabel.textColor = .black
        viewLabel.textAlignment = .center
        viewLabel.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
        view.addSubview(viewLabel)
    }

    @objc func actionButton(_ sender: UIButton) {
        let alertVc = alertViewController()
        alertVc.modalPresentationStyle = .overFullScreen
        present(alertVc, animated: true)
    }
}

