//
//  UIView.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import UIKit

extension UIView {
    // MARK: - Static Properties
    @objc class var reuseId: String {
        "\(className.decapitalizingFirstLetter)ReuseId"
    }
}
