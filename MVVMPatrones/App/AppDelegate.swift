//
//  AppDelegate.swift
//  MVVMPatrones
//
//  Created by Pedro on 3/10/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds) ?? UIWindow()

        let navigationController = UINavigationController()

        let splashViewController = SplashViewController()
        splashViewController.viewModel = SplashViewModel(viewDelegate: splashViewController)
        navigationController.setViewControllers([splashViewController], animated: true)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
