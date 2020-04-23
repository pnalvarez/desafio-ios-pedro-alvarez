//
//  CharacterDetailsCoordinator.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

class CharacterDetailsCoordinator: CoordinatorProtocol {

    var navigationController: UINavigationController
    
    var characterModel: CharacterModel?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let model = self.characterModel else { return }
        let vc = CharacterDetailsVCBuilder.make(characterModel: model, coordinator: self)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func startHQDetails(id: Int) {
        let coordinator = HQDetailsCoordinator(navigationController: navigationController)
        coordinator.id = id
        coordinator.start()
    }
}
