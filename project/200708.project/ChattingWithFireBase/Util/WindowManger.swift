//
//  WindowManger.swift
//  ChattingWithFireBase
//
//  Created by 이진욱 on 2020/07/08.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class WindowManger {
  // MARK: - VisibleViewControllerType
  
  enum VisibleViewControllerType {
    case sign
    case chat
    
    var controller: UIViewController {
      switch self {
      case .sign:
        return SignInViewController()
      case .chat:
        return UINavigationController (rootViewController: ChatViewViewController())
      }
    }
  }
  
  // MARK: - Window Change
  
  class func set (_ type: VisibleViewControllerType) {
    // UIApplication 앱 전체를 관리하는 곳
    guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = type.controller
    window.makeKeyAndVisible()
    delegate.window = window
  }
}



