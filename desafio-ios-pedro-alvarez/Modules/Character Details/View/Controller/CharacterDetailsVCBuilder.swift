//
//  CharacterDetailsVCBuilder.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

class CharacterDetailsVCBuilder {
    
    static func make(characterModel: CharacterModel, coordinator: CharacterDetailsCoordinator) -> CharacterDetailsVC {
        let presenter = CharacterDetailsPresenterBuilder.make(characterModel: characterModel)
        let vc = CharacterDetailsVC()
        
        vc.presenter = presenter
        vc.coordinator = coordinator
        
        return vc
    }
}
