//
//  AppDelegate.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UISceneDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        setUpMainWindow()
        
        return true
    }
    
    static func getRootVC() -> UIViewController {
        
        let rootViewController = LoginManager.shared.status ?
            UINavigationController(rootViewController: BookListViewController()) : LoginViewController()
        
        return rootViewController
    }
    
    func setUpMainWindow() {
        
        let vc = AppDelegate.getRootVC()
        
        window?.rootViewController = vc
        
        window?.makeKeyAndVisible()
    }
}
