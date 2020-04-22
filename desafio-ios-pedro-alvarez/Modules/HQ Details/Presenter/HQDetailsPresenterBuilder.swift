//
//  HQDetailsPresenterBuilder.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

class HQDetailsPresenterBuilder {
    
    static func make(id: Int, interactor: HQDetailsInteractorProtocol) -> HQDetailsPresenter {
        let presenter = HQDetailsPresenter(interactor: interactor, characterId: id)
        
        return presenter
    }
}
