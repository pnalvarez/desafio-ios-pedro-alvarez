//
//  SceneDelegate.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            UINavigationBar.setAppearance()
            let window = UIWindow(windowScene: windowScene)
            window.makeKeyAndVisible()
            self.window = window
            let launchVC = LaunchVCBuilder.make()
            launchVC.window = window
            window.rootViewController = launchVC
        }
    }
}

