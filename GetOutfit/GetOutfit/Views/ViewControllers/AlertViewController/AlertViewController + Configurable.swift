//
//  ErrorAlert + Configurable.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 10.04.2022.
//

import UIKit

extension AlertViewController {
    struct Layout {
        let alertViewRadius: CGFloat = 15
        let alertViewShadowRadius: CGFloat = 3
    }
    
    struct Appearance {
        let viewShadowColor: UIColor = UIColor.shadowColor
        let titleFont: UIFont = SFProDisplay.font(style: .bold, size: 18)
        let titleColot: UIColor = UIColor.textPrimary
        let messageFont: UIFont = SFProDisplay.font(style: .regular, size: 14)
        let messageColor: UIColor = UIColor.textSecondary
        let buttonColor: UIColor = UIColor.activeButton
        let buttonLabelFont: UIFont = SFProDisplay.font(style: .regular, size: 14)
        let buttonLabelColor: UIColor = UIColor.white
    }
}
