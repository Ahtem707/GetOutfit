//
//  RegistrationViewController.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 03.04.2022.
//

import UIKit

extension RegistrationViewController {
    struct Layout {
        let nextBtnRadius: CGFloat = 12
    }
    
    struct Appearance {
        let segmentControlBackground: UIColor = UIColor.segmentControlDefault
        let segmentControlActive: UIColor = UIColor.segmentControlActive
        let nextBtnBackground: UIColor = UIColor.blue
        let nextBtnTextFont: UIFont = SFProDisplay.font(style: .medium, size: 16)
        let nextBtnTextColor: UIColor = UIColor.white
    }
    
    struct TextConstants {
        let screenTitle = "Регистрация"
        let nameTextFieldPlaceholder = "Введите имя"
        let nextBtn = "Продолжить"
    }
}

final class RegistrationViewController: UIViewController {

    @IBOutlet private weak var nameTextField: BaseTextField!
    @IBOutlet private weak var genderSegment: UISegmentedControl!
    @IBOutlet private weak var nextButton: UIButton!
    
    let _layout = Layout()
    let _appearance = Appearance()
    let _text = TextConstants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSubviews()
        self.setuplayout()
        self.setupAppearance()
        self.setupContent()
    }
    
    private func setupSubviews() {
        
    }
    
    private func setuplayout() {
        nextButton.layer.cornerRadius = _layout.nextBtnRadius
    }
    
    private func setupAppearance() {
        genderSegment.backgroundColor = _appearance.segmentControlBackground
        genderSegment.selectedSegmentTintColor = _appearance.segmentControlActive
        nextButton.backgroundColor = _appearance.nextBtnBackground
        nextButton.titleLabel?.font = _appearance.nextBtnTextFont
        nextButton.titleLabel?.textColor = _appearance.nextBtnTextColor
    }
    
    private func setupContent() {
        self.title = _text.screenTitle
        nameTextField.setPlaceholder(_text.nameTextFieldPlaceholder)
        genderSegment.removeAllSegments()
        UserGender.allCases.reversed().forEach { [weak self] in
            self?.genderSegment.insertSegment(withTitle: $0.value, at: 0, animated: false)
        }
        genderSegment.selectedSegmentIndex = 0
        nextButton.setTitle(_text.nextBtn, for: .normal)
    }
}

// MARK: - Action
extension RegistrationViewController {
    @IBAction func nextBtnActive(_ sender: UIButton) {
        let index = genderSegment.selectedSegmentIndex
        let user = User()
        user.name = nameTextField.text
        user.gender = UserGender.allCases[index]
        StorageManager.user = user
        
        self.navigationController?.popToRootViewController(animated: false)
    }
}
