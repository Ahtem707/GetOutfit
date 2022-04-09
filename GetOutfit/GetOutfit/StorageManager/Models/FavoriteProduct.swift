//
//  FavoriteProduct.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import Foundation
import ObjectMapper

extension StorageManager {
    fileprivate static let favoriteProductKey = "favoritProduct"
    static var favoriteProduct: FavoriteProduct? {
        get {
            shared.mappable(type: FavoriteProduct.self, forKey: StorageManager.favoriteProductKey)
        }
        set {
            if newValue == nil {
                shared.removeObject(forKey: StorageManager.favoriteProductKey)
            }
            shared.set(newValue?.toJSONString(), forKey: StorageManager.favoriteProductKey)
        }
    }
}

final class FavoriteProduct: Mappable {
    var favoriteProductId: [Int]?
    
    init() {}
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        favoriteProductId <- map["favoriteProductId"]
    }
}
