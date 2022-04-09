//
//  FeedItemCollectionCell + InOut.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import UIKit

extension FeedItemCollectionCell {
    struct In {
        let image: URL?
        let title: String?
        let subTitle: String?
        let amount: Double?
    }

    struct Out {
        var didSelectFavorite: (() -> Void)?
    }
}
