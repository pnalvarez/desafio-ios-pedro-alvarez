//
//  LaunchVCBuilder.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 22/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

class LaunchVCBuilder {
    
    static func make() -> LaunchVC{
        let presenter = LaunchPresenter()
        let vc = LaunchVC()
        
        presenter.delegate = vc
        vc.presenter = presenter
        
        return vc
    }
}
