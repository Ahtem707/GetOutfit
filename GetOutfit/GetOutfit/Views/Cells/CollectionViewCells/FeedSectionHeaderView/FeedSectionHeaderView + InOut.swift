//
//  FeedSectionHeaderView + InOut.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import Foundation

extension FeedSectionHeaderView {
    struct In {
        let title: String
    }

    struct Out {
        var didSelectAllButton: (() -> Void)?
    }
}
