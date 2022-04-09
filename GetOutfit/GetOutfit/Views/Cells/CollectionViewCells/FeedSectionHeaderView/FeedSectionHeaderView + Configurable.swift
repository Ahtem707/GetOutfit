//
//  FeedSectionHeaderView + Configurable.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import UIKit

extension FeedSectionHeaderView {
    struct Appearance {
        let labelFont: UIFont = SFProDisplay.font(style: .regular, size: 24)
        let labelColor: UIColor = UIColor.textPrimary
        let allButtonFont: UIFont = SFProDisplay.font(style: .regular, size: 20)
        let allButtonColor: UIColor = UIColor.activeButton
    }
    
    struct Content {
        let allButton = "Все"
    }
}
