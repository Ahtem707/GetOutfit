//
//  UIImage.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 03.04.2022.
//

import UIKit

// MARK: - Установка заднего фона и текста для картинки
extension UIImageView {
    func setGradientLayer(colors: [UIColor]) {
        if colors.count > 2 || colors.count < 1 {
            assertionFailure("You can set only two colors")
        }
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.colors = colors.map { $0.cgColor }
        gradient.frame = self.bounds
        gradient.contentsScale = UIScreen.main.scale
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func setGradientLayer(color: UIColor) {
        self.layer.backgroundColor = color.cgColor
    }
    
    func setTextLayer(_ text: String, textFont: UIFont, textColor: UIColor) {
        let textLayer = CATextLayer()
        textLayer.font = textFont
        textLayer.fontSize = textFont.pointSize
        textLayer.frame.origin = CGPoint(x: 0, y: (self.bounds.height - textLayer.fontSize) / 2)
        textLayer.frame.origin = CGPoint(x: 0, y: (self.bounds.height - textFont.lineHeight) / 2)
        textLayer.frame.size = self.bounds.size
        textLayer.alignmentMode = .center
        textLayer.foregroundColor = textColor.cgColor
        textLayer.string = text
        textLayer.contentsScale = UIScreen.main.scale
        
        self.layer.insertSublayer(textLayer, at: 1)
    }
}
