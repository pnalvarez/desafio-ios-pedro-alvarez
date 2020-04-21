//
//  CharacterListInteractorBuilder.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

class CharacterListInteractorBuilder {
    
    static func make(provider: CharacterListProviderProtocol) -> CharacterListInteractor{
        return CharacterListInteractor(provider: provider)
    }
}
