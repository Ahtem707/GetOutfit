//
//  BaseTextField.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 03.04.2022.
//

import UIKit

extension BaseTextField {
    struct Layout {
        let textFieldEdge: UIEdgeInsets = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        let bottomLineEdge: UIEdgeInsets = UIEdgeInsets(top: 14, left: 0, bottom: 16, right: 0)
        let bottomLineSize: CGSize = CGSize(width: 0, height: 1)
    }

    struct Appearance {
        let textFieldFont: UIFont = SFProDisplay.font(style: .regular, size: 16)
        let textFieldColor: UIColor = UIColor.textPrimary
        let textFieldPlaceholderColor: UIColor = UIColor.textSecondary
        let bottomLineColor: UIColor = UIColor.separatorLine
    }
}

final class BaseTextField: CustomComponent {
    
    private let textField = UITextField()
    private let bottomLine = UIView()
    
    private let _layout = Layout()
    private let _appearance = Appearance()
    
    override func viewConfigure() {
        self.setupSubviews()
        self.setupLayouts()
        self.setupAppearance()
    }
    
    private func setupSubviews() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        
        textField.borderStyle = .none
    }
    
    private func setupLayouts() {
        self.addSubview(textField)
        self.addSubview(bottomLine)
        
        // fot textField
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(
                equalTo: topAnchor,
                constant: _layout.textFieldEdge.top),
            textField.leftAnchor.constraint(
                equalTo: leftAnchor,
                constant: _layout.textFieldEdge.left),
            textField.rightAnchor.constraint(
                equalTo: rightAnchor,
                constant: -_layout.textFieldEdge.right)
        ])
        
        // for bottomLine
        NSLayoutConstraint.activate([
            bottomLine.topAnchor.constraint(
                equalTo: textField.bottomAnchor,
                constant: _layout.bottomLineEdge.top),
            bottomLine.leftAnchor.constraint(
                equalTo: leftAnchor,
                constant: _layout.bottomLineEdge.left),
            bottomLine.rightAnchor.constraint(
                equalTo: rightAnchor,
                constant: -_layout.bottomLineEdge.right),
            bottomLine.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -_layout.bottomLineEdge.bottom),
            bottomLine.heightAnchor.constraint(
                equalToConstant: _layout.bottomLineSize.height)
        ])
    }
    
    private func setupAppearance() {
        textField.font = _appearance.textFieldFont
        textField.textColor = _appearance.textFieldColor
        bottomLine.backgroundColor = _appearance.bottomLineColor
    }
    
    func setPlaceholder(_ text: String) {
        textField.placeholder = text
    }
    
    var text: String? {
        return textField.text
    }
}
