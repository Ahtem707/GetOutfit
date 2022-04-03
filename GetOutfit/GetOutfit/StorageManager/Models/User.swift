//
//  User.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 03.04.2022.
//

import Foundation
import ObjectMapper

extension StorageManager {
    static var user: User? {
        get {
            shared.mappable(type: User.self, forKey: "user")
        }
        set {
            if newValue == nil {
                shared.removeObject(forKey: "user")
            }
            shared.set(newValue?.toJSONString(), forKey: "user")
        }
    }
}

enum UserGender: CaseIterable {
    case male
    case female
    
    var value: String {
        switch self {
            case .male: return "Мужчина"
            case .female: return "Женщина"
        }
    }
}

final class User: Mappable {
    var name: String?
    var gender: UserGender?
    
    init() {}
    required init?(map: Map) {}
    
    func mapping(map: Map) {
       name <- map["name"]
       gender <- map["gender"]
    }
}
