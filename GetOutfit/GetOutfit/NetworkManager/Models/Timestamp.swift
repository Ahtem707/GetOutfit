//
//  Timestamp.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import Foundation

struct Timestamp {
    /// Global timestamp formatter
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return formatter
    }()
}
