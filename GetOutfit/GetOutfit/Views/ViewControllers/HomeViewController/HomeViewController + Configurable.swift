//
//  HomeViewController + Configurable.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import UIKit

extension HomeViewController {
    struct Layout {
        let collectionSectionHeight: CGFloat = 50
        let collectionCellSize: CGSize = CGSize(width: 200, height: 350)
    }
    
    struct Appearance {
        
    }
    
    struct Content {
        let errorAlertTitle = "Сервис временно не доступен"
        let errorAlertMessage = "Проверьте подключение к интернету или попробуйте позже"
        let errorAlertButton = "Ок"
    }
}
