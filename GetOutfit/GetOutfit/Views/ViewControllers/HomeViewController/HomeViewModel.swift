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
    
    var dGroup: DispatchGroup? = DispatchGroup()
    
    init() {
        self.fetchProducts()
    }
}

// MARK: - HomeViewModelProtocol
extension HomeViewModel {
    
    func getNumberOfSections() -> Int {
        return 1
    }
    
    func getSectionItem(_ indexPath: IndexPath) -> (FeedSectionHeaderView.In?, FeedSectionHeaderView.Out?) {
        let input = FeedSectionHeaderView.In(
            title: "Test")
        
        return (input, nil)
    }
    
    func getNumberOfItemsInSection() -> Int {
        return products.count
    }
    
    func getCellContent(_ indexPath: IndexPath) -> (FeedItemCollectionCell.In?, FeedItemCollectionCell.Out?) {
        
        let item = products[indexPath.row]
        
        guard let id = item.id else { return (nil, nil) }
        let isFavorit = StorageManager.favoriteCash.contains(id)
        
        let input = FeedItemCollectionCell.In(
            id: id,
            image: item.pictures?.first,
            title: item.name,
            subTitle: item.vendorName,
            amount: item.price,
            isFavorit: isFavorit)
        
        let output = FeedItemCollectionCell.Out(
            didSelectFavoriteButtonClosure: { [weak self] (id, isFavorit) in
                if isFavorit {
                    StorageManager.favoriteCash.append(id)
                } else {
                    StorageManager.favoriteCash.removeAll(where: { $0 == id })
                }
            })
        
        return (input, output)
    }
    
    func getCellData(_ indexPath: IndexPath) -> Items {
        return products[indexPath.row]
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
        API.items(filter: nil).request { [weak self] (products: [Items]?) in
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
