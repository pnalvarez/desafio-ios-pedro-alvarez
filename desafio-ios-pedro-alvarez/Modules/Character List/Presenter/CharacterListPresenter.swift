//
//  CharacterListPresenter.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol CharacterListPresenterProtocol {
    var delegate: CharacterListPresenterDelegate? { get set}
    var characters: [CharacterModel] { get }
    var title: String { get }
    
    func cellWillDisplay(index: Int)
}

protocol CharacterListPresenterDelegate: class {
    func updateUI()
    func displayError()
}

class CharacterListPresenter: CharacterListPresenterProtocol {
    
    weak var delegate: CharacterListPresenterDelegate?
    
    private(set) var interactor: CharacterListInteractorProtocol
    
    private(set) var title: String = "Personagens"
    
    private(set) var characters: [CharacterModel] = [] {
        didSet {
            delegate?.updateUI()
        }
    }
    
    init(interactor: CharacterListInteractorProtocol = CharacterListInteractor()) {
        self.interactor = interactor
    }
    
    func cellWillDisplay(index: Int) {
        interactor.fetchWithIndex(index: index)
    }
}

extension CharacterListPresenter: CharacterListInteractorDelegate {
    
    func fetchedCharacters(_ characters: [CharacterModel]) {
        self.characters.append(contentsOf: characters)
    }
    
    func didGetError(_ errorType: APIError) {
        
    }
}
