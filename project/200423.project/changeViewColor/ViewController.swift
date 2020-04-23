//
//  ViewController.swift
//  changeViewColor
//
//  Created by 이진욱 on 2020/04/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var changeView: UIView!
    let blueButton = UIButton()
    let redButtion = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redButtion.frame = CGRect (x: 50, y: 500, width: 100, height: 100)
        redButtion.setTitle("red", for: .normal)
        redButtion.setTitleColor(.red, for: .normal)
        redButtion.backgroundColor = .white
        view.addSubview(redButtion)
        redButtion.addTarget(self, action: #selector(red), for: .touchUpInside)
        
        blueButton.frame = CGRect (x: 200, y: 500, width: 100, height: 100)
        blueButton.setTitle("blue", for: .normal)
        blueButton.setTitleColor(.blue, for: .normal)
        blueButton.backgroundColor = .white
        view.addSubview(blueButton)
        blueButton.addTarget(self, action: #selector(blue), for: .touchUpInside)
        
        changeView.frame = CGRect (x: 100, y: 200, width: 200, height: 100)
        changeView.backgroundColor = .black
        
    }
    @objc func blue (_ sender: UIButton) {
        changeView.backgroundColor = .blue
    }
    @objc func red (_ sender: UIButton) {
        changeView.backgroundColor = .red
    }
}

