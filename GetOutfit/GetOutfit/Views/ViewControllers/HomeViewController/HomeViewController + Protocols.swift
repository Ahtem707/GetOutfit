//
//  HomeProtocols.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import Foundation

typealias Closure = (() -> Void)

// MARK: - ViewController -> ViewModel
protocol HomeViewModelProtocol {
    var delegate: HomeViewControllerDelegate? { get set }
    var handleViewWillAppear: Closure? { get set }
    var handleViewDidAppear: Closure? { get set }
    var handleViewWillDisappear: Closure? { get set }
    func getNumberOfSections() -> Int
    func getSectionItem(_ indexPath: IndexPath) -> (FeedSectionHeaderView.In, FeedSectionHeaderView.Out)
    func getNumberOfItemsInSection() -> Int
    func getCellContent(_ indexPath: IndexPath) -> (FeedItemCollectionCell.In, FeedItemCollectionCell.Out)
}

// MARK: - ViewModel -> ViewController
protocol HomeViewControllerDelegate {
    func reload()
    func showError()
    func didSelectAllButton()
}
