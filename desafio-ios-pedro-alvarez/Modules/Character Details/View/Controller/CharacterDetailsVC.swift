//
//  CharacterDetailsVC.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//


import UIKit

class CharacterDetailsVC: UIViewController {
    
    let detailsView = CharacterDetailsVW()
    
    var presenter: CharacterDetailsPresenterProtocol?
    
    var coordinator: CharacterDetailsCoordinator?
    
    override func viewDidLoad() {
        title = presenter?.title
    }
    
    override func loadView() {
        guard let model = presenter?.characterModel else { return }
        detailsView.setup(characterModel: model)
        view = detailsView
    }
}
