//
//  HQDetailsVCBuilder.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

class HQDetailsVCBuilder {
    
    static func make(id: Int) -> HQDetailsVC {
        let interactor = HQDetailsInteractorBuilder.make(provider: HQDetailsProvider())
        let presenter = HQDetailsPresenterBuilder.make(id: id, interactor: interactor)
        let vc = HQDetailsVC()
        
        interactor.delegate = presenter
        presenter.delegate = vc
        vc.presenter = presenter
        
        return vc
    }
}
