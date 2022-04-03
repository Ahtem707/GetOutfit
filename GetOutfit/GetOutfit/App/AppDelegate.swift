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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // TODO: - Удаление данных пользователя, позволяет попасть на страницу регистрации
//        StorageManager.user = nil
        
        let rootVC = ViewController()
        let navigationController = UINavigationController(rootViewController: rootVC)
        if StorageManager.user == nil {
            let regVC = RegistrationViewController()
            navigationController.addChild(regVC)
        }
        window?.rootViewController = navigationController
        
        return true
    }
}

