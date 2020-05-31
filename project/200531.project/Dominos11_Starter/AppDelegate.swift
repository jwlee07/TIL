//
//  AppDelegate.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let categoryVC = CategoryViewController()
    let wishListVC = WishListViewController()
    let dominosTabBarController = UITabBarController()
    let navigationCategoryVC = UINavigationController(rootViewController: categoryVC)
    let navigationWishListVC = UINavigationController (rootViewController: wishListVC)
    
    let imageDominos = UIImage(named: "domino's")
    let imageWhisList = UIImage(named: "wishlist")
    
    
    navigationCategoryVC.tabBarItem = UITabBarItem (title: "Domino's", image: imageDominos, tag: 0)
    navigationWishListVC.tabBarItem = UITabBarItem (title: "Wish List", image: imageWhisList, tag: 1)
    
    dominosTabBarController.viewControllers = [navigationCategoryVC, navigationWishListVC]
    
    window?.makeKeyAndVisible()
    window?.rootViewController = dominosTabBarController
    window?.backgroundColor = .systemBackground
    return true
  }
  func setupTabBar() {
    
  }
}

