//
//  FavoriteProduct.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import Foundation
import ObjectMapper

extension StorageManager {
    
    static var favoriteCash: [Int] = []
    
    fileprivate static let favoriteProductKey = StorageManager.Keys.favoritProduct.str
    static var favoriteProduct: FavoriteProduct? {
        get {
            shared.mappable(type: FavoriteProduct.self, forKey: self.favoriteProductKey)
        }
        set {
            if newValue == nil {
                shared.removeObject(forKey: self.favoriteProductKey)
            }
            shared.set(newValue?.toJSONString(), forKey: self.favoriteProductKey)
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
