//
//  HomeViewMode.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import Foundation
import UIKit

class HomeViewModel: HomeViewModelProtocol {
    
    var delegate: HomeViewControllerDelegate?
    var handleViewDidAppear: Closure?
    
    var products: [Items] = []
    
    init() {
        self.fetchProducts()
    }
    
}

// MARK: - HomeViewModelProtocol
extension HomeViewModel {
    
    func getNumberOfSections() -> Int {
        return 1
    }
    
    func getSectionItem(_ indexPath: IndexPath) -> (FeedSectionHeaderView.In, FeedSectionHeaderView.Out) {
        let input = FeedSectionHeaderView.In(
            title: "Test")
        
        let output = FeedSectionHeaderView.Out()
        
        return (input, output)
    }
    
    func getNumberOfItemsInSection() -> Int {
        return products.count
    }
    
    func getCellContent(_ indexPath: IndexPath) -> (FeedItemCollectionCell.In, FeedItemCollectionCell.Out) {
        
        let item = products[indexPath.row]
        
        let input = FeedItemCollectionCell.In(
            image: item.pictures?.first,
            title: item.name,
            subTitle: item.vendorName,
            amount: item.price)
        
        let output = FeedItemCollectionCell.Out(
            didSelectFavorite: nil)
        
        return (input, output)
    }
}

// MARK: - Private function
extension HomeViewModel {
    private func fetchProducts() {
        
        let dGroup = DispatchGroup()
        var requestSuccess = false
        
        dGroup.enter()
        handleViewDidAppear = {
            dGroup.leave()
        }
        
        dGroup.enter()
        API.items(filter: nil, limit: 50).request { [weak self] (products: [Items]?) in
            if let products = products, !products.isEmpty {
                self?.products = products
                requestSuccess = true
            } else {
                requestSuccess = false
            }
            dGroup.leave()
        }
        
        dGroup.notify(queue: .main) { [weak self] in
            if requestSuccess {
                self?.delegate?.reload()
            } else {
                self?.delegate?.showError()
            }
        }
    }
}
