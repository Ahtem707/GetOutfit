//
//  ViewFactory.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 09.04.2022.
//

import Foundation

protocol ProfileViewFactoryProtocol {
    func makeUserProfileVC() -> StubViewController
    func makeSurveyVC() -> WebViewController
    func makeFavoriteBrandsVC() -> StubViewController
}

final class ProfileViewFactory: ProfileViewFactoryProtocol {
    func makeUserProfileVC() -> StubViewController {
        return StubViewController()
    }
    
    func makeSurveyVC() -> WebViewController {
        return WebViewController()
    }
    
    func makeFavoriteBrandsVC() -> StubViewController {
        return StubViewController()
    }
}
