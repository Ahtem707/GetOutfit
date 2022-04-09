//
//  HomeViewMode.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {
    
    var delegate: HomeViewControllerDelegate?
    
}

// MARK: - HomeViewModelProtocol
extension HomeViewModel {
    func getNumberOfSections() -> Int {
        return 2
    }
    
    func getSectionItem(_ indexPath: IndexPath) -> (FeedSectionHeaderView.In, FeedSectionHeaderView.Out) {
        let input = FeedSectionHeaderView.In(
            title: "Test")
        
        let output = FeedSectionHeaderView.Out()
        
        return (input, output)
    }
    
    func getNumberOfItemsInSection() -> Int {
        return 9
    }
    
    func getCellContent(_ indexPath: IndexPath) -> (FeedItemCollectionCell.In, FeedItemCollectionCell.Out) {
        
        let input = FeedItemCollectionCell.In(
            image: URL(string: "https://cdn-images.farfetch-contents.com/15/94/21/07/15942107_30120618_1000.jpg"),
            title: "title: \(indexPath.row)",
            subTitle: "subTitle: \(indexPath.row)",
            amount: "amount: \(indexPath.row)")
        
        let output = FeedItemCollectionCell.Out(
            didSelectFavorite: nil)
        
        return (input, output)
    }
}
