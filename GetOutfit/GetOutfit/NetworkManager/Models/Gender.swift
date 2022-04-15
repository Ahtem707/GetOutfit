//
//  Gender.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import Foundation

enum Gender: String, Codable, CaseIterable {
    
    // MARK: - Cases
    case male
    case female
    case other = "unisex"
    
    var value: String {
        switch self {
            case .male: return "Мужчина"
            case .female: return "Женщина"
            case .other: return "Другой"
        }
    }
    
    var str: String {
        switch self {
            case .male: return "Мужской"
            case .female: return "Женский"
            case .other: return "Другой"
        }
    }
}
