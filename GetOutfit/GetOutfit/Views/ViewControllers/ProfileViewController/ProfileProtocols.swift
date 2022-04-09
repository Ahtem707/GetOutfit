//
//  Protocols.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import Foundation

// MARK: - ViewController -> ViewModel
protocol ProfileViewModelDelegate {
    var delegate: ProfileViewControllerDelegate? { get set }
    var userName: String { get }
    func getTableCellCount() -> Int
    func getTableCellContent(_ index: Int) -> UserOptionCell.Input
    func didSelectTableCell(_ index: Int)
}

// MARK: - ViewModel -> ViewController
protocol ProfileViewControllerDelegate {
    func surveyAction()
    func favoriteBrandsAction()
    func exitAction()
}
