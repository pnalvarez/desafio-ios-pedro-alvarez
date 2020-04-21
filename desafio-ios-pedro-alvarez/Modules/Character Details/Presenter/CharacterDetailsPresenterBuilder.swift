//
//  CharacterDetailsPresenterBuilder.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

class CharacterDetailsPresenterBuilder {
    
    static func make(characterModel: CharacterModel) -> CharacterDetailsPresenter{
        return CharacterDetailsPresenter(characterModel: characterModel)
    }
}
