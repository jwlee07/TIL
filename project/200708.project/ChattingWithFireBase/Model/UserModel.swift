//
//  UserModel.swift
//  ChattingWithFireBase
//
//  Created by 이진욱 on 2020/07/08.
//  Copyright © 2020 jwlee. All rights reserved.
//

import Foundation

struct UserModel {
  let email: String
  let nickName: String
}

struct UserReference {
  static let email = "Email"
  static let nickName = "NickName"
}

