//
//  TabBarItems.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 04.04.2022.
//

import UIKit

enum TabBarItems: CaseIterable {
    case home
    case myImage
    case favorite
    case profile
    
    var viewController: UIViewController {
        switch self {
            case .home: return ViewController()
            case .myImage: return ViewController()
            case .favorite: return ViewController()
            case .profile: return ViewController()
        }
    }
    
    var title: String {
        switch self {
            case .home: return "Главная"
            case .myImage: return "Мои образы"
            case .favorite: return "Избранное"
            case .profile: return "Профиль"
        }
    }
    
    var image: UIImage? {
        switch self {
            case .home: return UIImage.tabbarHome
            case .myImage: return UIImage.tabbarMyImage
            case .favorite: return UIImage.tabbarFavorite
            case .profile: return UIImage.tabbarProfile
        }
    }
}
