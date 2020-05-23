//
//  AppDelegate.swift
//  wookiGame1
//
//  Created by 이진욱 on 2020/05/22.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = ViewController()
    window?.makeKeyAndVisible()
    window?.backgroundColor = .systemBackground
    
    return true
  }
}

