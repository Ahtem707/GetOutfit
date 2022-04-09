//
//  TableOptions.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import UIKit

enum ProfileUserOptions: CaseIterable {
    case survey
    case favoriteBrands
    case exit
    
    var image: UIImage? {
        switch self {
        default:
            return nil
        }
    }
    
    var title: String {
        switch self {
        case .survey:
            return "Пройти опрос"
        case .favoriteBrands:
            return "Любимые бренды"
        case .exit:
            return "Выход"
        }
    }
    
    var notification: Bool {
        switch self {
        case .survey:
            return true
        default:
            return false
        }
    }
}
