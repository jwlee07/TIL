//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by 이진욱 on 2020/04/25.
//  Copyright © 2020 jwlee. All rights reserved.
//

// UISwitch, UISegmentedControl 을 이용한 문제
// UISwitch : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현
// UISegmentedControl : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현
// 참고로, 위 2개는 버튼과 달리 event 처리를 touchUpInside 가 아니라 valueChanged 라는 것을 활용해야 함
import UIKit

class ViewController: UIViewController {
    let labelOnOff = UILabel()
    let switchOnOff = UISwitch()
    let segmentOnOff = UISegmentedControl(items: ["First", "Secound"])
    
    override func loadView() {
        let view = UIView()
        view.frame.size = CGSize (width: 414, height: 896)
        view.backgroundColor = .white
        self.view = view

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let labelOnOff = onOffLabel()
        let switchOnOff = onOffSwitch()
        let segmentOnOff = onOffsegment()
    }
    
    
    // Create 함수
    func onOffSwitch () {
        switchOnOff.frame = CGRect (x: view.center.x - 25, y: (view.frame.size.height)/2, width: 50, height: 50)
        switchOnOff.isOn = false
        switchOnOff.addTarget(self, action: #selector(labelChangeSwi(_:)), for: .valueChanged)
        view.addSubview(switchOnOff)
    }
    func onOffLabel () {
        labelOnOff.text = "off"
        labelOnOff.frame = CGRect (x: view.center.x - 25, y: (view.frame.size.height)/4, width: 200, height: 50)
        labelOnOff.textColor = .black
        labelOnOff.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(labelOnOff)
    }
    func onOffsegment () {
        segmentOnOff.frame = CGRect (x: (view.center.x) - 100, y: (view.frame.size.height)/3, width: 200, height: 50)
        segmentOnOff.backgroundColor = .gray
        segmentOnOff.tintColor = .white
        
        segmentOnOff.addTarget(self, action: #selector(labelChangeSeg(_:)), for: .valueChanged)
        view.addSubview(segmentOnOff)
    }
    
    // objc 함수
    @objc func labelChangeSwi (_ sender: UISwitch) {
        if sender.isOn {
            labelOnOff.text = "on"
        } else {
            labelOnOff.text = "off"
        }
    }
    @objc func labelChangeSeg (_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            labelOnOff.text = "First"
        case 1:
            labelOnOff.text = "Secound"
        default:
            break
        }
    }
}

