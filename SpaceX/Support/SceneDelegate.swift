//
//  SceneDelegate.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: HomeVC())
        self.window = window
        window.makeKeyAndVisible()
        
        window.overrideUserInterfaceStyle = .light
    }
}

