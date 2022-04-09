//
//  FeedSectionHeaderView + Configurable.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import UIKit

extension FeedSectionHeaderView {
    struct Appearance {
        let labelFont: UIFont = SFProDisplay.font(style: .regular, size: 14)
        let labelColor: UIColor = UIColor.textPrimary
    }
    
    struct Content {
        let allButton = "Все"
    }
}
