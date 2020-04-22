//
//  HQDetailsInteractorBuilder.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

class HQDetailsInteractorBuilder {
    
    static func make(provider: HQDetailsProviderProtocol) -> HQDetailsInteractor{
        let interactor = HQDetailsInteractor(provider: provider)
        return interactor
    }
}
