//
//  FeedSectionHeaderView.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import UIKit

class FeedSectionHeaderView: UICollectionReusableView, CollectionViewSectionProtocol {
    
    // MARK: - Outlets
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var allButton: UILabel!
    
    // MARK: - Private variable
    private let _appearance = Appearance()
    private let _content = Content()
    
    var input: In? {
        didSet { self.setupContent() }
    }
    var output: Out?
    var didSelectAllButtonClosure: Closure?
    
    // MARK: - Public function
    func setContent(_ text: String) {
        label.text = text
    }
}

// MARK: - Lifecycle
extension FeedSectionHeaderView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupSubviews()
        self.setupAppearance()
        self.setupStaticContent()
    }
}

// MARK: - Setup function
extension FeedSectionHeaderView {
    private func setupSubviews() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(allButtonAction))
        allButton.addGestureRecognizer(gesture)
    }
    
    private func setupAppearance() {
        label.font = _appearance.labelFont
        label.textColor = _appearance.labelColor
        allButton.font = _appearance.allButtonFont
        allButton.textColor = _appearance.allButtonColor
    }
    
    private func setupStaticContent() {
        allButton.text = _content.allButton
    }
    
    private func setupContent() {
        guard let input = input else { return }
        label.text = input.title
    }
}

// MARK: - Actions
extension FeedSectionHeaderView {
    @objc private func allButtonAction() {
        didSelectAllButtonClosure?()
    }
}
