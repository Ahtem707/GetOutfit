//
//  FeedItemCollectionCell + InOut.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import UIKit

extension FeedItemCollectionCell {
    struct In {
        let id: Int
        let image: URL?
        let title: String?
        let subTitle: String?
        let amount: Double?
        let isFavorit: Bool
    }

    struct Out {
        var didSelectFavoriteButtonClosure: ((_ productId: Int, _ isFavorite: Bool) -> Void)?
    }
}
