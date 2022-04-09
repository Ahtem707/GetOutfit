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
    
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    /// Capitalize only the first letter in the string, not in each word as in capitalized
    var capitalizingFirstLetter: String {
        prefix(1).capitalized + dropFirst()
    }
    
    /// Decapitalize only the first letter in the string
    var decapitalizingFirstLetter: String {
        prefix(1).lowercased() + dropFirst()
    }
}
