//
//  Occ.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import Foundation

struct Occasion: Codable {
    
    var id: Int?
    var name: String?
    var label: String?
    let gender: Gender?
    var categoryIDs: [Int]?
    var corneredSubcategoryIDs: [Int]?
    var corneredItemIDs: [String]?
    
    // MARK: - Types
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case label
        case gender
        case categoryIDs = "category_ids"
        case corneredSubcategoryIDs = "looks"
        case corneredItemIDs = "items"
        
        var str: String {
            return self.rawValue
        }
    }
    
    // MARK: - Decodable
    init(from decoder: Decoder) throws {
        // Get values from the container
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode each of the properties
        id = try? values.decode(Int.self, forKey: .id)
        name = try? values.decode(String.self, forKey: .name)
        label = try? values.decode(String.self, forKey: .label)
        gender = try? values.decode(Gender.self, forKey: .gender)
        categoryIDs = try? values.decode([Int].self, forKey: .categoryIDs)
        corneredSubcategoryIDs = try? values.decode([Int].self, forKey: .corneredSubcategoryIDs)
        corneredItemIDs = try? values.decode([String].self, forKey: .corneredItemIDs)
    }
}

