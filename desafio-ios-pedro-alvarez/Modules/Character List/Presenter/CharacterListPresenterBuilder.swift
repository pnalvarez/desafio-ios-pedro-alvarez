//
//  CharacterListPresenterBuilder.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

class CharacterListPresenterBuilder {
    
    static func make() -> CharacterListPresenter {
        let interactor = CharacterListInteractorBuilder.make(provider: CharacterListProvider())
        let presenter = CharacterListPresenter(interactor: interactor)
        
        interactor.delegate = presenter
        
        return presenter
    }
}
