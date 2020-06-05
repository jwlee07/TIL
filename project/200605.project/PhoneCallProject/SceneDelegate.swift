//
//  SceneDelegate.swift
//  PhoneCallProject
//
//  Created by 천지운 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        
        let mainVC = MainViewController()
        mainVC.title = "구해줘콜미"
        let naviVC = UINavigationController(rootViewController: mainVC)
        
        window?.rootViewController = naviVC
        window?.frame = UIScreen.main.bounds
        window?.makeKeyAndVisible()
    }
}
