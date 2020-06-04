//
//  MessageDATA.swift
//  PhoneCallProject
//
//  Created by 이진욱 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import Foundation
import UIKit

struct MessageData {
  
  static let sginInButton = UIButton()
  static let sginOutButton = UIButton()
  
  static var groupTextfield = UITextField()
  static var nameTextfield = UITextField()
  static var numberTextfield = UITextField()
  
  static var group: [String] = ["그룹 리스트 확인","그룹 추가하기"]
  static var name: [String] = []
  static var number: [String] = []
  static var messageText: String = ""
  static var messageUserList: [String:[[String:String]]] = [:]
  
  static var gropuLabel = UILabel()
  static var nameLabel = UILabel()
  static var numberuLabel = UILabel()
  
  static var CGcount: CGFloat = 0
  static var count = 1
  static var padding: CGFloat = 20
  
  static var messageDefault = UserDefaults.standard
}
