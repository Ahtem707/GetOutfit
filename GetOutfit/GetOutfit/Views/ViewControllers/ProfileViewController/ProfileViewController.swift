//
//  ProfileViewController.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import UIKit

extension ProfileViewController {
    struct Layout {
        let userImageCorner: Bool = true
    }
    
    struct Appearance {
        let userImageBackgrount: UIColor = UIColor.appBackground
        let userImageFont: UIFont = SFProDisplay.font(style: .regular, size: 24)
        let userImageColor: UIColor = UIColor.white
        let userNameFont: UIFont = SFProDisplay.font(style: .regular, size: 24)
        let userNameColor: UIColor = UIColor.textPrimary
    }
}

class ProfileViewController: UIViewController, ProfileViewControllerDelegate {

    @IBOutlet private weak var userView: UIView!
    @IBOutlet private weak var userImage: UIImageView!
    @IBOutlet private weak var userName: UILabel!
    
    @IBOutlet private weak var tableView: UITableView!
    
    let _layout = Layout()
    let _appearance = Appearance()
    var viewModel: ProfileViewModelDelegate? = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupSubviews()
        self.setupLayout()
        self.setupAppearance()
        self.setupContent()
        self.viewModel?.delegate = self
    }
    
    private func setupSubviews() {
        userView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onUserViewTap)))
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCellNib(UserOptionCell.self)
    }
    
    private func setupLayout() {
        if _layout.userImageCorner {
            userImage.layer.cornerRadius = userImage.frame.height / 2
        }
    }
    
    private func setupAppearance() {
        userImage.setGradientLayer(color: _appearance.userImageBackgrount)
        userName.font = _appearance.userNameFont
        userName.textColor = _appearance.userNameColor
    }
    
    private func setupContent() {
        guard let name = viewModel?.userName else { return }
        userName.text = name
        let firstLater = String(name.prefix(1))
        userImage.setTextLayer(firstLater,
                               textFont: _appearance.userNameFont,
                               textColor: _appearance.userImageColor)
    }
}

// MARK: - TableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getTableCellCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserOptionCell = tableView.dequeueReusableCell()
        cell.setupContent(viewModel?.getTableCellContent(indexPath.row))
        return cell
    }
}

// MARK: - TableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectTableCell(indexPath.row)
    }
}

// MARK: - Actions
extension ProfileViewController {
    
    @objc func onUserViewTap() {
        
    }
    
    func surveyAction() {
        
    }
    
    func favoriteBrandsAction() {
        
    }
    
    func exitAction() {
        // Удалить текущего пользователя
        StorageManager.user = nil
        // Переход на регистрацию
        AppDelegate.updateRootViewController()
    }
}
