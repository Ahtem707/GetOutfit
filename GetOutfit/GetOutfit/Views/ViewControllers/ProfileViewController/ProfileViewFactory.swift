//
//  ViewFactory.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import Foundation

protocol ProfileViewFactoryProtocol {
    func makeUserProfileVC() -> StubViewController
    func makeSurveyVC() -> StubViewController
    func makeFavoriteBrandsVC() -> StubViewController
}

final class ProfileViewFactory: ProfileViewFactoryProtocol {
    func makeUserProfileVC() -> StubViewController {
        return StubViewController()
    }
    
    func makeSurveyVC() -> StubViewController {
        return StubViewController()
    }
    
    func makeFavoriteBrandsVC() -> StubViewController {
        return StubViewController()
    }
}
