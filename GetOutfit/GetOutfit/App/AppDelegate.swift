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
        
        // Загрузить данные в кеш
        if let ids = StorageManager.favoriteProduct?.favoriteProductId {
            StorageManager.favoriteCash = ids
        } else {
            StorageManager.favoriteCash = []
        }
        
        let vc = AppDelegate.updateRootViewController()
        window?.rootViewController = vc
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Загрузить данные из кеша в UserDefault
        let favorit = FavoriteProduct()
        favorit.favoriteProductId = StorageManager.favoriteCash
        StorageManager.favoriteProduct = favorit
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
