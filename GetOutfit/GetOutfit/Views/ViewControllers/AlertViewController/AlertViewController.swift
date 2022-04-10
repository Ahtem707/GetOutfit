//
//  AlertViewController.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 10.04.2022.
//

import UIKit

extension AlertViewController {
    static func show(_ viewController: UIViewController, type: AlertTypes) {
        let alertVC = AlertViewController()
        alertVC.setContentForType(type)
        viewController.present(alertVC, animated: true) {
            alertVC.blackOut(true)
        }
    }
}

class AlertViewController: UIViewController {

    @IBOutlet private weak var alertView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var alertIcon: UIImageView!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var completeButton: UIButton!
    
    let _layout = Layout()
    let _appearance = Appearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupSubview()
        self.setupLayout()
        self.setupAppearance()
    }
    
    private func setupSubview() {
        alertView.layer.masksToBounds = false
        alertView.layer.shadowOpacity = 1
    }
    
    private func setupLayout() {
        alertView.layer.cornerRadius = _layout.alertViewRadius
        alertView.layer.shadowRadius = _layout.alertViewShadowRadius
    }
    
    private func setupAppearance() {
        view.backgroundColor = UIColor.clear
        alertView.layer.shadowColor = _appearance.viewShadowColor.cgColor
        titleLabel.font = _appearance.titleFont
        titleLabel.textColor = _appearance.titleColot
        messageLabel.font = _appearance.messageFont
        messageLabel.textColor = _appearance.messageColor
        completeButton.backgroundColor = _appearance.buttonColor
        completeButton.titleLabel?.font = _appearance.buttonLabelFont
        completeButton.titleLabel?.textColor = _appearance.buttonLabelColor
    }
    
    func setContentForType(_ type: AlertTypes) {
        alertIcon.image = type.image
        titleLabel.text = type.title
        messageLabel.text = type.message
    }
    
    func blackOut(_ state: Bool, completion: Closure? = nil) {
        UIView.animate(
            withDuration: 1,
            animations: { [weak self] in
                if state {
                    self?.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
                } else {
                    self?.view.backgroundColor = UIColor.clear
                }
            },
            completion: { _ in
                completion?()
            })
    }
    @IBAction func completeButtonAction(_ sender: UIButton) {
        blackOut(false) { [weak self] in
            self?.dismiss(animated: true)
        }
    }
}
