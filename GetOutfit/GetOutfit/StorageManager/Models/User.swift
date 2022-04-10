//
//  User.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 03.04.2022.
//

import Foundation
import ObjectMapper

extension StorageManager {
    fileprivate static let userKey = StorageManager.Keys.user.str
    static var user: User? {
        get {
            shared.mappable(type: User.self, forKey: self.userKey)
        }
        set {
            if newValue == nil {
                shared.removeObject(forKey: self.userKey)
            }
            shared.set(newValue?.toJSONString(), forKey: self.userKey)
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
