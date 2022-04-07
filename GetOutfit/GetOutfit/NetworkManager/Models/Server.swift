//
//  Server.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import Foundation

struct Server: Codable {
    var server: String?
    var isShouldLog: Bool?
    
    // MARK: - Types
    enum CodingKeys: String, CodingKey {
        case server
        case isShouldLog = "should_log"
        
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
        server = try? values.decode(String.self, forKey: .server)
        isShouldLog = try? values.decode(Bool.self, forKey: .isShouldLog)
    }
}
