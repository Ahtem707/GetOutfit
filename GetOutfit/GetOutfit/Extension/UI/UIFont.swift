//
//  UIFont.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 03.04.2022.
//

import Foundation
import UIKit

enum SFProDisplayStyle: String {
    case black = "SFProDisplay-Black"
    case bold = "SFProDisplay-Bold"
    case light = "SFProDisplay-Light"
    case medium = "SFProDisplay-Medium"
    case regular = "SFProDisplay-Regular"
    case semibold = "SFProDisplay-Semibold"
}

struct SFProDisplay {
    
    static func font(style: SFProDisplayStyle, size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}
