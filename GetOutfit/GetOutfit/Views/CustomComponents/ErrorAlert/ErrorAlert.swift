//
//  ErrorAlert.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 10.04.2022.
//

import UIKit

extension ErrorAlert {
    static func show(_ viewController: UIViewController, type: ErrorAlertTypes) -> ErrorAlert {
        let alertView = ErrorAlert()
        alertView.type = type
        alertView.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(alertView)
        NSLayoutConstraint.activate([
            alertView.widthAnchor.constraint(equalToConstant: alertView.viewSize.width),
            alertView.heightAnchor.constraint(equalToConstant: alertView.viewSize.height),
            alertView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            alertView.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor)
        ])
        return alertView
    }
    
    static func hide(_ alertView: ErrorAlert) {
        alertView.removeFromSuperview()
    }
}

class ErrorAlert: CustomComponent {
    
    private var alertIcon = UIImageView()
    private var titleLabel = UILabel()
    private var messageLabel = UILabel()
    
    private let _layout = Layout()
    private let _appearance = Appearance()
    
    var type: ErrorAlertTypes = .noFavorites
    
    var viewSize: CGSize {
        return _layout.viewSize
    }
    
    override func viewConfigure() {
        super.viewConfigure()
        self.setupSubview()
        self.setupLayout()
        self.setupAppearance()
        self.setupContent()
    }
    
    private func setupSubview() {
        alertIcon.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.textAlignment = .center
    }
    
    private func setupLayout() {
        self.addSubview(alertIcon)
        self.addSubview(titleLabel)
        self.addSubview(messageLabel)
        
//        self.layer.cornerRadius.
        
        NSLayoutConstraint.activate([
            alertIcon.topAnchor.constraint(equalTo: topAnchor, constant: _layout.alertIconEdge.top),
            alertIcon.widthAnchor.constraint(equalToConstant: _layout.alertIconSize.width),
            alertIcon.heightAnchor.constraint(equalToConstant: _layout.alertIconSize.height),
            alertIcon.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: alertIcon.bottomAnchor, constant: _layout.titleEdge.top),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: _layout.titleEdge.left),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -(_layout.titleEdge.right))
        ])
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: _layout.messageEdge.top),
            messageLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: _layout.messageEdge.left),
            messageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -(_layout.messageEdge.right))
        ])
    }
    
    private func setupAppearance() {
        titleLabel.font = _appearance.titleFont
        titleLabel.textColor = _appearance.titleColot
        messageLabel.font = _appearance.messageFont
        messageLabel.textColor = _appearance.messageColor
    }
    
    func setupContent() {
        alertIcon.image = type.image
        titleLabel.text = type.title
        messageLabel.text = type.message
    }
}
