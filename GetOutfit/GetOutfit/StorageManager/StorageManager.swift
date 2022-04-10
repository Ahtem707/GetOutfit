//
//  StorageManager.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 03.04.2022.
//

import Foundation
import ObjectMapper

final class StorageManager {
    static let shared = UserDefaults.standard
    
    enum Keys: String {
        case user
        case favoritProduct
        
        var str: String {
            return self.rawValue
        }
    }
}

extension UserDefaults {
    func set(_ mappable: Mappable?, forKey key: String) {
        set(mappable?.toJSONString(), forKey: key)
    }

    func mappable<T: Mappable>(type: T.Type, forKey key: String) -> T? {
        guard let json = string(forKey: key) else {
            return nil
        }
        
        return type.init(JSONString: json)
    }
}
