//
//  ViewController.swift
//  changeColor
//
//  Created by 이진욱 on 2020/04/26.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let colorLabel = UILabel()
    let colorView = UIView()
    let colorSeg = UISegmentedControl(items: ["red","blue","green"])
    
    override func loadView() {
        let view = UIView()
        view.frame.size = CGSize (width: 414, height: 896)
        view.backgroundColor = .white
        self.view = view
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let colorView = createView()
        let colorLabel = createLabel()
        let colorSeg = createSeg()
    }
    func createLabel () {
        colorLabel.text = "color"
        colorLabel.frame = CGRect (x: view.center.x, y: view.center.y, width: 100, height: 100)
        colorLabel.textColor = .black
        view.addSubview(colorLabel)
    }
    func createView () {
        colorView.frame = CGRect (x: (view.center.x)/3, y: view.center.y, width: 300, height: 200)
        colorView.backgroundColor = .gray
        colorView.tintColor = .black
        super.view.addSubview(colorView)
    }
    func createSeg () {
        colorSeg.frame = CGRect (x: (view.center.x)/3, y: (view.center.y) - 300, width: 300, height: 50)
        colorSeg.backgroundColor = .gray
        colorSeg.tintColor = .white
        colorSeg.addTarget(self, action: #selector(changeColor), for: .valueChanged)
        view.addSubview(colorSeg)
    }
    @objc func changeColor() {
        switch colorSeg.selectedSegmentIndex {
        case 0:
        colorLabel.text = "red"
        colorView.backgroundColor = .red
        case 1:
        colorLabel.text = "blue"
        colorView.backgroundColor = .blue
        case 2:
        colorLabel.text = "green"
        colorView.backgroundColor = .green
        default:
            break
        }
    }
}


