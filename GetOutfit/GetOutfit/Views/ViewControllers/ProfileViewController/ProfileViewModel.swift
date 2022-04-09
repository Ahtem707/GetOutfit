//
//  ProfileViewModel.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 07.04.2022.
//

import Foundation

class ProfileViewModel: ProfileViewModelDelegate {
    
    var delegate: ProfileViewControllerDelegate?
    
    var userName: String {
        if let name = StorageManager.user?.name {
            return name
        }
        assertionFailure("Error in logic, there is no user")
        return "!Error!"
    }
    
    private let userOptions = ProfileUserOptions.allCases
    
    func getTableCellCount() -> Int {
        return userOptions.count
    }
    
    func getTableCellContent(_ index: Int) -> UserOptionCell.Input {
        let input = UserOptionCell.Input(
            image: userOptions[index].image,
            text: userOptions[index].title,
            notification: userOptions[index].notification)
        return input
    }
    
    func didSelectTableCell(_ index: Int) {
        switch userOptions[index] {
        case .survey:
            delegate?.surveyAction()
        case .favoriteBrands:
            delegate?.favoriteBrandsAction()
        case .exit:
            delegate?.exitAction()
        }
    }
}
