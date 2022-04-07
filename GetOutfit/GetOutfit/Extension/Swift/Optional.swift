//
//  Optional.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 05.04.2022.
//

import Foundation

// Опциональное присвоение
infix operator ?=
func ?=<T> (lhs: inout T, rhs: T?) {
    if rhs != nil {
        lhs = rhs!
    }
}
