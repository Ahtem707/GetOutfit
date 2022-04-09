//
//  HomeProtocols.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import Foundation

// MARK: - ViewController -> ViewModel
protocol HomeViewModelProtocol {
    var delegate: HomeViewControllerDelegate? { get set }
    func getNumberOfSections() -> Int
    func getSectionItem(_ indexPath: IndexPath) -> (FeedSectionHeaderView.In, FeedSectionHeaderView.Out)
    func getNumberOfItemsInSection() -> Int
    func getCellContent(_ indexPath: IndexPath) -> (FeedItemCollectionCell.In, FeedItemCollectionCell.Out)
}

// MARK: - ViewModel -> ViewController
protocol HomeViewControllerDelegate {
    
}
