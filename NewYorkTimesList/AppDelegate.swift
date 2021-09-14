//
//  AppDelegate.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UISceneDelegate {
    
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpMainWindow()
        return true
    }
    
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            setUpMainWindow()
        }
    }

    private func setUpMainWindow() {
        let vc = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
}
