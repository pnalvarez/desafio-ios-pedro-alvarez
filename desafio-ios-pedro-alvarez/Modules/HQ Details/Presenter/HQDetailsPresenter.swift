//
//  HQDetailsPresenter.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol HQDetailsPresenterProtocol {
    var delegate: HQDetailsPresenterDelegate? { get set}
    var title: String { get }
    var hqModel: HQModel? { get }
    
    func fetch()
}

protocol HQDetailsPresenterDelegate: class {
    func updateUI()
    func didGetError()
}

class HQDetailsPresenter: HQDetailsPresenterProtocol {
    
    weak var delegate: HQDetailsPresenterDelegate?
    
    private(set) var interactor: HQDetailsInteractorProtocol
    
    private(set) var characterId: Int
    
    private(set) var title: String = "Detalhes HQ"
    
    private(set) var hqModel: HQModel? {
        didSet {
            self.delegate?.updateUI()
        }
    }
    
    init(interactor: HQDetailsInteractorProtocol,
         characterId: Int) {
        self.interactor = interactor
        self.characterId = characterId
    }
    
    func fetch() {
        interactor.fetchHQ(forId: characterId)
    }
}

extension HQDetailsPresenter: HQDetailsInteractorDelegate {
    
    func didFetchHQDetails(_ details: HQModel) {
        self.hqModel = details
    }
    
    func didGetError(_ error: APIError) {
        delegate?.didGetError()
    }
}


