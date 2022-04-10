//
//  ProductViewController.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 10.04.2022.
//

import UIKit

class ProductViewController: BaseViewController {

    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var vendor: UILabel!
    @IBOutlet private weak var gender: UILabel!
    @IBOutlet private weak var size: UILabel!
    @IBOutlet private weak var color: UILabel!
    @IBOutlet private weak var category: UILabel!
    
    private let _appearance = Appearance()
    private let _content = Content()
    
    var input: In?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupAppearance()
        self.setupContent()
        
        // TODO: - Временно отключено
        self.category.isHidden = true
    }
    
    private func setupAppearance() {
        let labels = [
            self.name,
            self.vendor,
            self.gender,
            self.size,
            self.color,
            self.category
        ]
        labels.forEach { [weak self] in
            $0?.font = self?._appearance.labelFont
            $0?.textColor = self?._appearance.labelColor
        }
    }
    
    private func setupContent() {
        guard let input = input else { return }

        productImage.sd_setImage(with: input.imageUrl, placeholderImage: UIImage.clothesDefault)
        name.text = _content.name + (input.name ?? "")
        vendor.text = _content.vendor + (input.vendor ?? "")
        gender.text = _content.gender + (input.gender?.str ?? "")
        size.text = _content.size + (input.size ?? "")
        color.text = _content.color + (input.color ?? "")
        category.text = _content.category + (input.category ?? "")
    }
}
