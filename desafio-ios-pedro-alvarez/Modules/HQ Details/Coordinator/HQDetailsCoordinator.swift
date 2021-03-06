//
//  HQDetailsCoordinator.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit
 
class HQDetailsCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    var id: Int?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let id = self.id else { return }
        let vc = HQDetailsVCBuilder.make(id: id)
        navigationController.pushViewController(vc, animated: true)
    }
}
