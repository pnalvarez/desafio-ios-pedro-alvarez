//
//  LaunchVC.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 22/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class LaunchVC: UIViewController {
    
    var window: UIWindow?
    
    let launchView = LaunchVW()
    
    var presenter: LaunchPresenterProtocol?
    
    override func viewDidLoad() {
        presenter?.viewDidLoad()
    }
    
    override func loadView() {
        view = launchView
    }
}

extension LaunchVC: LaunchPresenterDelegate {
    
    func didGetTime() {
        let navigationController = UINavigationController()
        let coordinator = CharacterListCoordinator(navigationController: navigationController)
        window?.rootViewController = navigationController
        coordinator.start()
    }
}
