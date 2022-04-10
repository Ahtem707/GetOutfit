//
//  HomeProtocols.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import Foundation

// MARK: - ViewController -> ViewModel
protocol FavoriteViewModelProtocol {
    var delegate: FavoriteViewControllerDelegate? { get set }
    var handleViewWillAppear: Closure? { get set }
    var handleViewDidAppear: Closure? { get set }
    var handleViewWillDisappear: Closure? { get set }
    func getNumberOfItemsInSection() -> Int
    func getCellContent(_ indexPath: IndexPath) -> (FeedItemCollectionCell.In?, FeedItemCollectionCell.Out?)
}

// MARK: - ViewModel -> ViewController
protocol FavoriteViewControllerDelegate {
    func reload()
    func showError()
    func hideErrors()
}
