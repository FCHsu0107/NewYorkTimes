//
//  SceneDelegate.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/15.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        
        setUpMainWindow()
    }

    private func setUpMainWindow() {
        
        let vc = AppDelegate.getRootVC()
        
        window?.rootViewController = vc
        
        window?.makeKeyAndVisible()
    }
}

