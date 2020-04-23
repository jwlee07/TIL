//
//  ViewController.swift
//  labelCount
//
//  Created by 이진욱 on 2020/04/23.
//  Copyright © 2020 jwlee. All rights reserved.
//
//1. Button을 누를 때마다 Label 의 값 변경하기
//1) +버튼 또는 -버튼을 누르면 숫자가 증가/감소하도록 만들기
//2) 숫자가 증가할 때는 label의 텍스트 색을 파란색, 감소할 때는 빨간색으로 변경


import UIKit

class ViewController: UIViewController {
    var labelCount = 0
    let label = UILabel()
    let increaseButton = UIButton()
    let decreaseButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        increaseButton.frame = CGRect (x: 50, y: 500, width: 100, height: 100)
        increaseButton.setTitle("증가", for: .normal)
        increaseButton.backgroundColor = .blue
        view.addSubview(increaseButton)
        increaseButton.addTarget(self, action: #selector(increase), for: .touchUpInside)
        
        decreaseButton.frame = CGRect (x: 250, y: 500, width: 100, height: 100)
        decreaseButton.setTitle("감소", for: .normal)
        decreaseButton.backgroundColor = .red
        view.addSubview(decreaseButton)
        decreaseButton.addTarget(self, action: #selector(decrease), for: .touchUpInside)
        
        label.frame = CGRect (x: 200, y: 100, width: 200, height: 200)
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "1"
        label.textColor = .black
        view.addSubview(label)
    }
    @objc func increase (_ sender: UIButton) {
            labelCount += 1
            label.text = String(labelCount)
            label.textColor = .blue
    }
    @objc func decrease (_ sender: UIButton) {
            labelCount -= 1
            label.text = String(labelCount)
            label.textColor = .red
        }
}


