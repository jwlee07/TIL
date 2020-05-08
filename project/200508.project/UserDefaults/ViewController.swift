//
//  ViewController.swift
//  UserDefaults
//
//  Created by giftbot on 2020. 05. 06..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  @IBOutlet private weak var datePicker: UIDatePicker!
  @IBOutlet private weak var alertSwitch: UISwitch!
  
  let userDefault = UserDefaults.standard

  struct Key {
    static let today = "today"
    static let alarmSw = "alarmSwitch"
  }
  
  // MARK: Action Handler
  
  @IBAction func saveData(_ button: UIButton) {
    // Userdefaults를 사용하여 alarm switch, datePicker의 값 저장
    
    userDefault.set(datePicker.date, forKey: Key.today)
    userDefault.set(alertSwitch.isOn, forKey: Key.alarmSw)
  }
  
  @IBAction func loadData(_ button: UIButton) {
    // Alarm Switch, DatePicker의 값 불러오기
    // Switch와 DatePicker에 불러온 값 세팅
    
    let alertRes = userDefault.bool(forKey: Key.alarmSw)
    let dateRes = (userDefault.object(forKey: Key.today) as? Date) ?? Date()
    alertSwitch.setOn(alertRes, animated: true)
    datePicker.setDate(dateRes, animated: true)
  }
}

