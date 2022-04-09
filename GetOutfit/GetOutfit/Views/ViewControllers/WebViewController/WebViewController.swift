//
//  WebViewController.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 10.04.2022.
//

import UIKit
import WebKit

extension WebViewController {
    struct Layout {
        let buttonRadius: CGFloat = 15
    }
    
    struct Appearance {
        let buttonColor: UIColor = UIColor.appBackground
        let buttonLabelFont: UIFont = SFProDisplay.font(style: .medium, size: 16)
        let buttonLabelColor: UIColor = UIColor.white
    }
    
    struct Content {
        let screenTitle = "Пройти опрос"
        let forMale = "Для него"
        let forFemale = "Для нее"
    }
}

class WebViewController: BaseViewController {

    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var forMaleButton: UIButton!
    @IBOutlet private weak var forFemaleButton: UIButton!
    
    let _layout = Layout()
    let _appearance = Appearance()
    let _content = Content()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSubview()
        self.setupLayout()
        self.setupLayout()
        self.setupContent()
    }
    
    private func setupSubview() {
        self.webViewIsEnable(false)
        forMaleButton.addTarget(self, action: #selector(forMaleAction), for: .touchUpInside)
        forFemaleButton.addTarget(self, action: #selector(forFemaleAction), for: .touchUpInside)
    }
    
    private func setupLayout() {
        forMaleButton.layer.cornerRadius = _layout.buttonRadius
        forFemaleButton.layer.cornerRadius = _layout.buttonRadius
    }
    
    private func setupAppearance() {
        forMaleButton.backgroundColor = _appearance.buttonColor
        forMaleButton.titleLabel?.font = _appearance.buttonLabelFont
        forMaleButton.titleLabel?.textColor = _appearance.buttonLabelColor
        forFemaleButton.backgroundColor = _appearance.buttonColor
        forFemaleButton.titleLabel?.font = _appearance.buttonLabelFont
        forFemaleButton.titleLabel?.textColor = _appearance.buttonLabelColor
    }
    
    private func setupContent() {
        title = _content.screenTitle
    }
    
    @objc func forMaleAction() {
        self.setupWebView(type: .male)
    }
    
    @objc func forFemaleAction() {
        self.setupWebView(type: .female)
    }
    
    private func webViewIsEnable(_ state: Bool) {
        webView.isHidden = !state
        forMaleButton.isHidden = state
        forMaleButton.isEnabled = !state
        forFemaleButton.isHidden = state
        forFemaleButton.isEnabled = !state
    }
    
    private func setupWebView(type: Gender) {
        self.webViewIsEnable(true)
        
        let path: String
        switch type {
        case .male:
            path = "malequizua"
        case .female:
            path = "femalequizua"
        default:
            path = ""
        }
        
        if let url = URL(string: AppConfig.siteUrl + path) {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }
}
