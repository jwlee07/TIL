//
//  AViewController.swift
//  ABC
//
//  Created by 이진욱 on 2020/04/27.
//  Copyright © 2020 jwlee. All rights reserved.
//
/*
문제: 3개의 뷰 컨트롤러 사이에 화면 전환하기
     A는 B로 가는 버튼
     B는 A로 돌아가는 dismiss 버튼과 C로 가는 버튼
     C는 A 또는 B로 돌아가는 dismiss 버튼

(참고)
A -> B
  <- B -> C
     B <- C
A   <-    C
*/

import UIKit

class AViewController: UIViewController {
    let GoToB = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        createGoToB()
    }
    func createGoToB() {
        GoToB.setTitle("GoToB", for: .normal)
        GoToB.frame = CGRect (x: view.center.x, y: view.center.y, width: 100, height: 100)
        GoToB.sizeToFit()
        GoToB.setTitleColor(.black, for: .normal)
        GoToB.addTarget(self, action: #selector(changeViewB), for: .touchUpInside)
        view.addSubview(GoToB)
    }
    @objc func changeViewB() {
        let changeB = BViewController()
        present(changeB, animated: true)
    }
}

