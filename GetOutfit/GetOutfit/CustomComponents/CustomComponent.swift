//
//  CustomComponent.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 03.04.2022.
//

import UIKit

@IBDesignable class CustomComponent: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.viewConfigure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.viewConfigure()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.viewConfigure()
    }
    
    func viewConfigure() {}
}
