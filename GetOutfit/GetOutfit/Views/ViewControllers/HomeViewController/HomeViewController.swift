//
//  HomeViewController.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import UIKit

class HomeViewController: TabBarItemViewController, HomeViewControllerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: HomeViewModelProtocol? = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FeedSectionHeaderView.registerView(with: collectionView)
        FeedItemCollectionCell.registerCell(with: collectionView)
        
        viewModel?.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.handleViewDidAppear?()
    }
    
    func reload() {
        collectionView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(
            title: "Сервис временно не доступен",
            message: "Проверьте подключение к интернету или попробуйте позже",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "Ок",
            style: .default,
            handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

// MARK: - CollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
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

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 350)
    }
}

// MARK: - CollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: - FeedSectionHeaderViewDelegate
extension HomeViewController {
    func didSelectAllButton() {
        print("myLog: didSelectAllButton")
    }
}
