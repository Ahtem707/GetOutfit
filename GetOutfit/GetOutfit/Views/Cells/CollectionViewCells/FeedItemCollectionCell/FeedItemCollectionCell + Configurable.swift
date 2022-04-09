//
//  FeedItemCollectionCell + Configurable.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import UIKit

extension FeedItemCollectionCell {
    
    struct Layout {
        let contentViewRadius: CGFloat = 15
        let contentViewShadowRadius: CGFloat = 3
    }
    
    struct Appearance {
        let contentViewShadowColor: UIColor = UIColor.shadowColor
        let titleFont: UIFont = SFProDisplay.font(style: .bold, size: 18)
        let titleColor: UIColor = UIColor.textPrimary
        let subTitleFont: UIFont = SFProDisplay.font(style: .regular, size: 18)
        let subTitleColor: UIColor = UIColor.textPrimary
        let amountFont: UIFont = SFProDisplay.font(style: .regular, size: 14)
        let amountColor: UIColor = UIColor.textPrimary
    }
    
    struct Content {
        let productImage: UIImage = UIImage.tabbarFavorite
    }
}
