//
//  ErrorAlertTypes.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 10.04.2022.
//

import UIKit

enum ErrorAlertTypes {
    case noFavorites
    
    var image: UIImage {
        switch self {
        case .noFavorites:
            return UIImage.favoritEmpty
        }
    }
    
    var title: String {
        switch self {
        case .noFavorites:
            return "У вас нет избранных продуктов"
        }
    }
    
    var message: String {
        switch self {
        case .noFavorites:
            return "Здесь будут отображены продукты что попали в раздел избранных"
        }
    }
}
