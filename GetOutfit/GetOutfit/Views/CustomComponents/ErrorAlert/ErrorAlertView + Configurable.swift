//
//  ErrorAlert + Configurable.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 10.04.2022.
//

import UIKit

extension ErrorAlert {
    
    struct Layout {
        let viewSize: CGSize = CGSize(width: 250, height: 300)
        let viewRadius: CGFloat = 15
        let alertIconEdge: UIEdgeInsets = UIEdgeInsets(all: 14)
        let alertIconSize: CGSize = CGSize(width: 100, height: 100)
        let titleEdge: UIEdgeInsets = UIEdgeInsets(all: 14)
        let messageEdge: UIEdgeInsets = UIEdgeInsets(all: 14)
    }
    
    struct Appearance {
        let titleFont: UIFont = SFProDisplay.font(style: .bold, size: 18)
        let titleColot: UIColor = UIColor.textPrimary
        let messageFont: UIFont = SFProDisplay.font(style: .regular, size: 14)
        let messageColor: UIColor = UIColor.textSecondary
    }
}
