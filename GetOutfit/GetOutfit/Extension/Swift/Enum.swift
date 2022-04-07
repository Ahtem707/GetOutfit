//
//  Enum.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 05.04.2022.
//

import Foundation

protocol UrlPath {
    var asUrlPath: String { get }
}

extension UrlPath {
    var asUrlPath: String {
        var res = "\(self)"
        res = res.replacingOccurrences(of: #"\(.*\)"#, with: "", options: .regularExpression)
        res = res.replacingOccurrences(of: #"^"#, with: "/", options: .regularExpression)
        return res
    }
}
