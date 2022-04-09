//
//  AppDelegate.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 03.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static var rootVC: UIViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc = AppDelegate.updateRootViewController()
        window?.rootViewController = vc
        
        return true
    }
}

extension AppDelegate {
    // TODO: - Не нравиться реализация, пересмотреть
    @discardableResult
    static func updateRootViewController() -> UIViewController {
        let navVC: UIViewController
        if StorageManager.user == nil {
            let vc = RegistrationViewController()
            navVC = UINavigationController(rootViewController: vc)
        } else {
            navVC = TabBarViewController()
        }
        UIApplication.shared.keyWindow?.rootViewController = navVC
        return navVC
    }
}
