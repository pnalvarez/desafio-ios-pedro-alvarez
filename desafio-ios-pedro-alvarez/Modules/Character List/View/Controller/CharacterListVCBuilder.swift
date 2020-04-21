//
//  CharacterListVCBuilder.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

class CharacterListVCBuilder {
    
    static func make(coordinator: CharacterListCoordinator) -> CharacterListVC {
        let vc = CharacterListVC()
        let presenter = CharacterListPresenterBuilder.make()
        
        presenter.delegate = vc
        vc.presenter = presenter
        
        vc.coordinator = coordinator
        
        return vc
    }
}
