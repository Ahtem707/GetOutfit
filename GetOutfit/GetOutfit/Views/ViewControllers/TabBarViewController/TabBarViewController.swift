//
//  TabBarViewController2.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 04.04.2022.
//

import UIKit

extension TabBarViewController {
    struct Appearance {
        let tabbarBackground: UIColor = UIColor.white
        let tabbarTintColor: UIColor = UIColor.textPrimary
    }
}

class TabBarViewController: UITabBarController {
    
    let _appearance = Appearance()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupAppearance()
        self.setupTabBarItems()
    }
    
    private func setupAppearance() {
        self.tabBar.backgroundColor = _appearance.tabbarBackground
        self.tabBar.tintColor = _appearance.tabbarTintColor
    }
    
    private func setupTabBarItems() {
        self.viewControllers = TabBarItems.allCases.compactMap {
            let vc = $0.viewController
            let nav = UINavigationController(rootViewController: vc)
            vc.tabBarItem.title = $0.title
            vc.tabBarItem.image = $0.image
            vc.navigationController?.navigationBar.isHidden = true
            return nav
        }
    }
}
