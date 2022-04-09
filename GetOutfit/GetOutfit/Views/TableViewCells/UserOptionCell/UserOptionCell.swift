//
//  UserOptionCell.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import UIKit

extension UserOptionCell {
    struct Input {
        let image: UIImage?
        let text: String
        var notification: Bool = false
    }
}

extension UserOptionCell {
    struct Layout {
        let notificationRadius: Bool = true
    }
    
    struct Appearance {
        let labelFont: UIFont = SFProDisplay.font(style: .regular, size: 16)
        let labelColor: UIColor = UIColor.textPrimary
        let notificationColor: UIColor = UIColor.notification
    }
}

class UserOptionCell: UITableViewCell {
    
    static let reuseId = String.className(UserOptionCell.self)

    @IBOutlet private weak var optionIcon: UIImageView!
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var notificationView: UIView!
    @IBOutlet private weak var pointView: UIView!
    
    let _layout = Layout()
    let _appearance = Appearance()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupLayout()
        self.setupAppearance()
    }
    
    private func setupLayout() {
        if _layout.notificationRadius {
            pointView.layer.cornerRadius = pointView.frame.height / 2
        }
    }
    
    private func setupAppearance() {
        label.font = _appearance.labelFont
        label.textColor = _appearance.labelColor
    }
    
    func setupContent(_ input: Input?) {
        if let image = input?.image {
            optionIcon.image = image
            optionIcon.isHidden = false
        } else {
            optionIcon.isHidden = true
        }
        
        label.text = input?.text
        
        if input?.notification ?? false {
            notificationView.isHidden = false
        } else {
            notificationView.isHidden = true
        }
    }
}
