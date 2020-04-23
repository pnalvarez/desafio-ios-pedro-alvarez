//
//  CharacterListCoordinator.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class CharacterListCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CharacterListVCBuilder.make(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func startDetails(characterModel: CharacterModel) {
        let detailsCoordinator = CharacterDetailsCoordinator(navigationController: navigationController)
        detailsCoordinator.characterModel = characterModel
        detailsCoordinator.start()
    }
}
