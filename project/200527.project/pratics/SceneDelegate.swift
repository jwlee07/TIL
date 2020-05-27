//
//  SceneDelegate.swift
//  pratics
//
//  Created by 이진욱 on 2020/05/27.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let _ = (scene as? UIWindowScene) else { return }
    
    let firstVC = ViewController()
    let secondVC = SecondViewController()
    let thirdVC = ThirdViewController()
    
    let firstNavigation = UINavigationController (rootViewController: firstVC)
    let secondNavigation = UINavigationController (rootViewController: secondVC)
    let thirdNavigation = UINavigationController (rootViewController: thirdVC)
    
    let ViewControllerTabBar = UITabBarController()
    firstNavigation.tabBarItem = UITabBarItem (title: "FirstView", image: UIImage(systemName: "1.circle"), tag: 0)
    secondNavigation.tabBarItem = UITabBarItem (title: "SecondView", image: UIImage(systemName: "2.circle"), tag: 1)
    thirdNavigation.tabBarItem = UITabBarItem (title: "ThirdView", image: UIImage(systemName: "3.circle"), tag: 2)
    ViewControllerTabBar.viewControllers = [firstNavigation, secondNavigation, thirdNavigation]
    
    window?.rootViewController = ViewControllerTabBar
    window?.makeKeyAndVisible()
    window?.backgroundColor = .systemBackground
  }

  func sceneDidDisconnect(_ scene: UIScene) {}

  func sceneDidBecomeActive(_ scene: UIScene) {}

  func sceneWillResignActive(_ scene: UIScene) {}

  func sceneWillEnterForeground(_ scene: UIScene) {}

  func sceneDidEnterBackground(_ scene: UIScene) {}
}

