//
//  UIColor.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 03.04.2022.
//

import Foundation
import UIKit

extension UIColor {
    static let appBackground = UIColor(hex: "#8DBDAF")
    static let textPrimary = UIColor(hex: "#000000")
    static let textSecondary = UIColor(hex: "#818181")
    static let separatorLine = UIColor(hex: "#000000")
    static let segmentControlDefault = UIColor(hex: "#EEEEEF")
    static let segmentControlActive = UIColor(hex: "#8DBDAF")
    static let tabbarBackground = UIColor(hex: "#FCFCFC")
    static let tabbarDisable = UIColor(hex: "#9EACAA")
    static let tabbarActive = UIColor(hex: "#000000")
    static let notification = UIColor(hex: "#F99D14")
}

// MARK: - Additional initializers
extension UIColor {
    convenience init(hex hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
