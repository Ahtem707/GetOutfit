//
//  String.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 05.04.2022.
//

import Foundation

extension String {
    
    func format(_ value: Any?) -> String? {
        guard let value = value else { return nil }
        let res = "\(value)".replacingOccurrences(of: ".", with: ",")
        return String(format: self, res)
    }
}
