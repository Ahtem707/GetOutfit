//
//  User.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 03.04.2022.
//

import Foundation
import ObjectMapper

extension StorageManager {
    fileprivate static let userKey = "user"
    static var user: User? {
        get {
            shared.mappable(type: User.self, forKey: StorageManager.userKey)
        }
        set {
            if newValue == nil {
                shared.removeObject(forKey: StorageManager.userKey)
            }
            shared.set(newValue?.toJSONString(), forKey: StorageManager.userKey)
        }
    }
}

final class User: Mappable {
    var name: String?
    var gender: Gender?
    
    init() {}
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        name <- map["name"]
        gender <- map["gender"]
    }
}
