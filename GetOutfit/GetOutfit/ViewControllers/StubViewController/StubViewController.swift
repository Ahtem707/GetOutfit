//
//  StubViewController.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import UIKit

extension StubViewController {
    struct Appearance {
        let stubImage = UIImage.stubImage
        let labelFont = SFProDisplay.font(style: .bold, size: 14)
        let labelColor = UIColor.textPrimary
    }
    
    struct Text {
        let label = "Данный раздел все еще находится в разработке.\nПросим прощения за неудобства"
    }
}

class StubViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    let _appearance = Appearance()
    let _text = Text()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = _appearance.stubImage
        label.font = _appearance.labelFont
        label.textColor = _appearance.labelColor
        label.text = _text.label
    }
}
