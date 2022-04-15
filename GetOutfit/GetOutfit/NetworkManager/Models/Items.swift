//
//  Items.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import Foundation

struct Items: Codable {
    var id: Int?
    var categoryID: Int?
    var modifiedTime: Date?
    var name: String?
    var oldPrice: Double?
    var pictures: [URL]?
    var price: Double?
    var url: URL?
    var vendorName: String?
    var gender: Gender?
    var size: String?
    var color: String?
    var subcategoryIDs: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "category_id"
        case modifiedTime = "modified_time"
        case name
        case oldPrice = "old_price"
        case pictures
        case price
        case url
        case vendorName = "vendor"
        case gender
        case size
        case color
        case subcategoryIDs
        
        var str: String {
            return self.rawValue
        }
    }
    
    init() {}
    
    // MARK: - Decodable
    init(from decoder: Decoder) throws {
        // Get values from the container
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode each of the properties
        if let idStr = try? values.decode(String.self, forKey: .id) {
            id = Int(idStr)
        }
        categoryID = try? values.decode(Int.self, forKey: .categoryID)
        let modifiedTimestamp = try? values.decode(String.self, forKey: .modifiedTime)
        modifiedTime = Date.timestamp(from: modifiedTimestamp)
        name = try? values.decode(String.self, forKey: .name)
        oldPrice = try? values.decode(Double.self, forKey: .oldPrice)
        pictures = try? values.decode([URL].self, forKey: .pictures)
        price = try? values.decode(Double.self, forKey: .price)
        url = try? values.decode(URL.self, forKey: .url)
        vendorName = try? values.decode(String.self, forKey: .vendorName)
        gender = try? values.decode(Gender.self, forKey: .gender)
        size = try? values.decode(String.self, forKey: .size)
        color = try? values.decode(String.self, forKey: .color)
        subcategoryIDs = try? values.decode([Int].self, forKey: .subcategoryIDs)
    }
}
