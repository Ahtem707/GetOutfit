//
//  HomeViewController.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import UIKit

class HomeViewController: TabBarItemViewController, HomeViewControllerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let _layout = Layout()
    let _appearance = Appearance()
    let _content = Content()
    
    var viewModel: HomeViewModelProtocol? = HomeViewModel()
    
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
extension HomeViewController: UICollectionViewDataSource {
    
    // TODO: - Временное отключение разделения на секции
    // Количество секций
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return viewModel?.getNumberOfSections() ?? 0
//    }
    
    // Контент заголовка
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header: FeedSectionHeaderView = collectionView.dequeue(kind: kind, indexPath: indexPath)
//        if let viewModel = viewModel {
//            (header.input, header.output) = viewModel.getSectionItem(indexPath)
//        }
//        header.didSelectAllButtonClosure = { [weak self] in
//            self?.didSelectAllButton()
//        }
//        return header
//    }
    
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
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: _layout.collectionSectionHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return _layout.collectionCellSize
    }
}

// MARK: - CollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let input = viewModel?.getCellData(indexPath)
        
        let productVC = ProductViewController()
        productVC.input = ProductViewController.In(
            imageUrl: input?.pictures?.first,
            name: input?.name,
            vendor: input?.vendorName,
            gender: input?.gender,
            size: input?.size,
            color: input?.color,
            category: "Error")
        self.navigationController?.pushViewController(productVC, animated: true)
    }
}

// MARK: - HomeViewControllerDelegate
extension HomeViewController {
    func reload() {
        collectionView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(
            title: _content.errorAlertTitle,
            message: _content.errorAlertMessage,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: _content.errorAlertButton,
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func didSelectAllButton() {
        // TODO: - Нажатие на кнопку просмотра всех продуктов
    }
}
