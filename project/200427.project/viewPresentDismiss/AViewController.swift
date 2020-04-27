//
//  ViewController.swift
//  viewPresentDismiss
//
//  Created by 이진욱 on 2020/04/27.
//  Copyright © 2020 jwlee. All rights reserved.
//
/*
1. ViewController 데이터 전달
> AViewController 와 BViewController 를 만든 뒤, 각각 하나씩의 Label 생성
> A에서 B로 화면을 넘어갈 때는 B의 Label 값이 이전 값에서 +3 증가
> B에서 A로 화면을 넘어갈 때는 A의 Label 값이 이전 값에서 +1 증가
  e.g. A에서 B로 갈 때 3, B에서 다시 A로 넘어올 때 4, 다시 A에서 B로 가면 7, 다시 A로 오면 8
*/


import UIKit

class ViewController: UIViewController {
    let countLabelA = UILabel()
    let buttonA = UIButton()
    var numCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLabelA()
        createButtonA()
        view.backgroundColor = .purple
        
    }
    func createLabelA() {
        countLabelA.text = "0"
        countLabelA.frame = CGRect (x: view.center.x - 50, y: view.center.y - 200, width: 200, height: 50)
        countLabelA.textColor = .black
        countLabelA.textAlignment = .center
        view.addSubview(countLabelA)
    }
    func createButtonA() {
        buttonA.setTitle("ButtonA", for: .normal)
        buttonA.frame = CGRect (x: view.center.x - 50, y: view.center.y, width: 200, height: 100)
        buttonA.setTitleColor(.blue, for: .normal)
        buttonA.addTarget(self, action: #selector(presentView(_:)), for: .touchUpInside)
        view.addSubview(buttonA)
    }
    @objc func presentView(_ sender: UIButton) {
        let changeViewB = BViewController()
        numCount += 3
        changeViewB.countLabelB.text = String(numCount)
        present(changeViewB, animated: true)
    }
}

