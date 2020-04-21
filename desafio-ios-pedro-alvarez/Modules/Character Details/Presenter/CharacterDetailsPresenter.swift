//
//  CharacterDetailsPresenter.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol CharacterDetailsPresenterProtocol {
    var title: String { get }
    var characterModel: CharacterModel { get }
}

class CharacterDetailsPresenter: CharacterDetailsPresenterProtocol {
    
    private(set) var characterModel: CharacterModel
    
    private(set) var title: String = "Detalhes"
    
    init(characterModel: CharacterModel) {
        self.characterModel = characterModel
    }
}
