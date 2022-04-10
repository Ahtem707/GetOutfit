//
//  ProductViewController + Configurable.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 10.04.2022.
//

import UIKit

extension ProductViewController {
    struct Appearance {
        let labelFont: UIFont = SFProDisplay.font(style: .regular, size: 22)
        let labelColor: UIColor = UIColor.textPrimary
    }
    
    struct Content {
        let imageDefault: UIImage = UIImage.clothesDefault
        let name = "Название: "
        let vendor = "Продавец: "
        let gender = "Пол: "
        let size = "Размер: "
        let color = "Цвет: "
        let category = "Категория: "
    }
}
