//
//  new.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import Foundation

struct Onboarding: Codable {
    // MARK: - Properties
    /// Onboarding image (displayed in the background)
    var image: URL?
    
    /// Onboarding title (displayed on top of popup)
    var title: String?
    
    /// Onboarding text (displayed in the popup)
    var text: String?
    
    // MARK: - Types
    enum CodingKeys: String, CodingKey {
        case image
        case title
        case text
        
        var str: String {
            return self.rawValue
        }
    }
}
