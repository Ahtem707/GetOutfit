//
//  HomeViewController.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import UIKit

class FavoriteViewController: TabBarItemViewController, FavoriteViewControllerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let _layout = Layout()
    let _appearance = Appearance()
    let _content = Content()
    
    var viewModel: FavoriteViewModelProtocol? = FavoriteViewModel()
    
    var alertViews: [ErrorAlert] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FeedSectionHeaderView.registerView(with: collectionView)
        FeedItemCollectionCell.registerCell(with: collectionView)
        
        viewModel?.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.handleViewWillAppear?()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.handleViewDidAppear?()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel?.handleViewWillDisappear?()
    }
}

// MARK: - CollectionViewDataSource
extension FavoriteViewController: UICollectionViewDataSource {
    
    // Количество ячеек в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getNumberOfItemsInSection() ?? 0
    }
    
    // Контент ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: FeedItemCollectionCell = collectionView.dequeue(indexPath)
        if let viewModel = viewModel {
            (cell.input, cell.output) = viewModel.getCellContent(indexPath)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FavoriteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: _layout.collectionSectionHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return _layout.collectionCellSize
    }
}

// MARK: - CollectionViewDelegate
extension FavoriteViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: - Нажатие на продукт
    }
}

// MARK: - HomeViewControllerDelegate
extension FavoriteViewController {
    func reload() {
        collectionView.reloadData()
    }
    
    func showError() {
        let alertView = ErrorAlert.show(self, type: .noFavorites)
        self.alertViews.append(alertView)
    }
    
    func hideErrors() {
        self.alertViews.forEach {
            ErrorAlert.hide($0)
        }
    }
}
