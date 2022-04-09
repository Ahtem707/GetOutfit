//
//  UICollectionView.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import UIKit

extension UICollectionReusableView {
    /// Registers the header view with the collection view
    /// - Parameter collectionView: the collection view to register with
    /// - Returns: (optional) returns cell identifier
    @discardableResult static func registerViewForClass(with collectionView: UICollectionView?) -> String {
        collectionView?.register(
            Self.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: reuseId
        )
        return reuseId
    }
    
    /// Registers the header view with the collection view
    /// - Parameter collectionView: the collection view to register with
    /// - Returns: (optional) returns cell identifier
    @discardableResult static func registerView(with collectionView: UICollectionView?) -> String {
        let nib = UINib(nibName: "\(self)", bundle: nil)
        collectionView?.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseId)
        return reuseId
    }
}

extension UICollectionViewCell {
    /// Registers the cell with the collection view
    /// - Parameter collectionView: the collection view to register with
    /// - Returns: (optional) returns cell identifier
    @discardableResult static func registerCellForClass(with collectionView: UICollectionView?) -> String {
        collectionView?.register(Self.self, forCellWithReuseIdentifier: reuseId)
        return reuseId
    }
    
    /// Registers the cell with the collection view
    /// - Parameter collectionView: the collection view to register with
    /// - Returns: (optional) returns cell identifier
    @discardableResult static func registerCell(with collectionView: UICollectionView?) -> String {
        let nib = UINib(nibName: "\(self)", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: reuseId)
        return reuseId
    }
}

extension UICollectionView {
    
    func dequeue<T: UICollectionViewCell>(_ indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseId, for: indexPath) as! T
    }
    
    func dequeue<T: UICollectionReusableView>(kind: String, indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.reuseId, for: indexPath) as! T
    }
}
