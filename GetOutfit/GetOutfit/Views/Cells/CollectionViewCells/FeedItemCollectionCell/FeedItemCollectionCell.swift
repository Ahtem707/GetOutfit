//
//  FeedSectionHeaderView.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import UIKit
import SDWebImage

class FeedItemCollectionCell: UICollectionViewCell, CollectionViewCellProtocol {
    
    // MARK: - Outlets
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var subTitle: UILabel!
    @IBOutlet private weak var amount: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    // MARK: - Private variable
    private let _layout = Layout()
    private let _appearance = Appearance()
    private let _content = Content()
    
    var input: In? {
        didSet { self.setupContent() }
    }
    var output: Out?
    
    private var isFavorit: Bool = false
}

// MARK: - Lifecycle
extension FeedItemCollectionCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupSubviews()
        self.setupLayout()
        self.setupAppearance()
        self.setupStaticContent()
    }
}

// MARK: - Setup function
extension FeedItemCollectionCell {
    private func setupSubviews() {
        backgroundView?.layer.masksToBounds = false
        backgroundView?.layer.shadowOpacity = 1
        title.textAlignment = .center
        subTitle.textAlignment = .center
        amount.textAlignment = .center
        favoriteButton.addTarget(self, action: #selector(favoriteButtonAction), for: .touchUpInside)
    }
    
    private func setupLayout() {
        backgroundView?.layer.cornerRadius = _layout.contentViewRadius
        backgroundView?.layer.shadowRadius = _layout.contentViewShadowRadius
    }
    
    private func setupAppearance() {
        backgroundView?.layer.shadowColor = _appearance.contentViewShadowColor.cgColor
        title.font = _appearance.titleFont
        title.textColor = _appearance.titleColor
        subTitle.font = _appearance.subTitleFont
        subTitle.textColor = _appearance.subTitleColor
        amount.font = _appearance.amountFont
        amount.textColor = _appearance.amountColor
    }
    
    private func setupStaticContent() {
        favoriteButton.setImage(_content.favoriteButton, for: .normal)
        title.text = _content.defaultTitle
        subTitle.text = _content.defaultVendor
        amount.text = _content.defaultAmount
    }
    
    private func setupContent() {
        guard let input = input else { return }
        isFavorit = input.isFavorit
        updateFavoritButton()
        productImage.sd_setImage(with: input.image, placeholderImage: UIImage.clothesDefault)
        title.text ?= input.title
        subTitle.text ?= input.subTitle
        amount.text ?= "%@ $".format(input.amount)
    }
    
    private func updateFavoritButton() {
        let image = isFavorit ? _content.favoriteButtonSelected : _content.favoriteButton
        favoriteButton.setImage(image, for: .normal)
    }
}

// MARK: - Actions
extension FeedItemCollectionCell {
    @objc private func favoriteButtonAction() {
        isFavorit = !isFavorit
        updateFavoritButton()
        if let id = input?.id {
            output?.didSelectFavoriteButtonClosure?(id, isFavorit)
        }
    }
}
