//
//  AppDelegate.swift
//  ChattingWithFireBase
//
//  Created by 이진욱 on 2020/07/08.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    FirebaseApp.configure()
    
    Auth.auth().currentUser == nil ?
      WindowManger.set(.sign) :
      WindowManger.set(.chat)
    
    
//    window = UIWindow(frame: UIScreen.main.bounds)
//    window?.backgroundColor = .systemBackground
//    window?.rootViewController = SignInViewController()
//    window?.makeKeyAndVisible()
    
    return true
  }
}

