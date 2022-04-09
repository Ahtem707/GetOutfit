//
//  CollectionViewHeaderProtocol.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import Foundation

protocol CollectionViewSectionProtocol {
    associatedtype In
    associatedtype Out
    var input: In? { get set }
    var output: Out? { get set }
}
