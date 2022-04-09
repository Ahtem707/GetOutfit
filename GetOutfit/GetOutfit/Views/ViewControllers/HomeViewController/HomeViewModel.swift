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
    var handleViewWillAppear: Closure?
    var handleViewDidAppear: Closure?
    var handleViewWillDisappear: Closure?
    
    var products: [Items] = []
    var favoritProducts: [Int] = []
    
    var dGroup: DispatchGroup? = DispatchGroup()
    
    init() {
        self.fetchProducts()
        self.setupClosures()
    }
    
    private func setupClosures() {
        handleViewWillAppear = { [weak self] in
            if let favorites = StorageManager.favoriteProduct?.favoriteProductId {
                self?.favoritProducts = favorites
            }
        }
        
        handleViewWillDisappear = { [weak self] in
            let favorites = FavoriteProduct()
            favorites.favoriteProductId = self?.favoritProducts
            StorageManager.favoriteProduct = favorites
        }
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
        
        let isFavorit = favoritProducts.contains(item.id)
        
        let input = FeedItemCollectionCell.In(
            id: item.id,
            image: item.pictures?.first,
            title: item.name,
            subTitle: item.vendorName,
            amount: item.price,
            isFavorit: isFavorit)
        
        let output = FeedItemCollectionCell.Out(
            didSelectFavoriteButtonClosure: { [weak self] (id, isFavorit) in
                if isFavorit {
                    self?.favoritProducts.append(id)
                } else {
                    self?.favoritProducts.removeAll(where: { $0 == id })
                }
            })
        
        return (input, output)
    }
}

// MARK: - Private function
extension HomeViewModel {
    private func fetchProducts() {
        
        var requestSuccess = false
        
        self.dGroup?.enter()
        handleViewDidAppear = { [weak self] in
            self?.dGroup?.leave()
        }
        
        self.dGroup?.enter()
        API.items(filter: nil, limit: 50).request { [weak self] (products: [Items]?) in
            if let products = products, !products.isEmpty {
                self?.products = products
                requestSuccess = true
            } else {
                requestSuccess = false
            }
            self?.dGroup?.leave()
        }
        
        self.dGroup?.notify(queue: .main) { [weak self] in
            if requestSuccess {
                self?.delegate?.reload()
            } else {
                self?.delegate?.showError()
            }
            self?.dGroup = nil
        }
    }
}