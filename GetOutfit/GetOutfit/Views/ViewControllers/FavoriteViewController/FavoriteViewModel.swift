//
//  HomeViewMode.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import Foundation
import UIKit

class FavoriteViewModel: FavoriteViewModelProtocol {
    
    var delegate: FavoriteViewControllerDelegate?
    var handleViewWillAppear: Closure?
    var handleViewDidAppear: Closure?
    var handleViewWillDisappear: Closure?
    
    var products: [Items] = []
    
    init() {
        self.setupClosures()
    }
    
    private func setupClosures() {
        handleViewWillAppear = { [weak self] in
            self?.fetchProducts()
        }
    }
}

// MARK: - HomeViewModelProtocol
extension FavoriteViewModel {
    
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
}

// MARK: - Private function
extension FavoriteViewModel {
    private func fetchProducts() {
        
        var dGroup: DispatchGroup? = DispatchGroup()
        var requestSuccess = false
        
        let ids = StorageManager.favoriteCash
        if !ids.isEmpty {
            dGroup?.enter()
            API.items(filter: nil, limit: nil, ids: ids).request { [weak self] (products: [Items]?) in
                if let products = products, !products.isEmpty {
                    self?.products = products
                    requestSuccess = true
                } else {
                    requestSuccess = false
                }
                dGroup?.leave()
            }
        } else {
            self.products = []
            self.delegate?.reload()
            self.delegate?.showError()
        }

        dGroup?.notify(queue: .main) { [weak self] in
            if requestSuccess {
                self?.delegate?.hideErrors()
            } else {
                self?.delegate?.showError()
            }
            self?.delegate?.reload()
            dGroup = nil
        }
    }
}
