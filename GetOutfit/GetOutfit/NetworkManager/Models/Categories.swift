//
//  Categories.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 04.04.2022.
//

import Foundation

struct Categories: Codable {
    var id: Int?
    var name: String?
    
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        
        var str: String {
            return self.rawValue
        }
    }
}
