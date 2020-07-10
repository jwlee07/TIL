//
//  SceneDelegate.swift
//  CafeSpot
//
//  Copyright © 2020 Giftbot. All rights reserved.
// With. 홍원표형님

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    // MARK: - setup TabBarController
    
    let mainVC = MainViewController()
    let mapMainVC = MapMainViewController()
    
    let navigationMainVC = UINavigationController(rootViewController: mainVC)
    let navigationMapMainVC = UINavigationController (rootViewController: mapMainVC)
    
    let tabBarVC = UITabBarController()
    
    navigationMainVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
    navigationMapMainVC.tabBarItem = UITabBarItem (title: "지도 검색", image: UIImage(systemName: "map.fill"), tag: 1)
    
    tabBarVC.viewControllers = [navigationMainVC, navigationMapMainVC]
    
    window?.rootViewController = tabBarVC
    window?.backgroundColor = .systemBackground
    window?.makeKeyAndVisible()
    
  }
}
