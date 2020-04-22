//
//  HQDetailsInteractor.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol HQDetailsInteractorProtocol {
    var delegate: HQDetailsInteractorDelegate? { get set }
    
    func fetchHQ(forId id: Int)
}

protocol HQDetailsInteractorDelegate: class {
    func didFetchHQDetails(_ details: HQModel)
    func didGetError(_ error: APIError)
}

class HQDetailsInteractor: HQDetailsInteractorProtocol {
    
    weak var delegate: HQDetailsInteractorDelegate?
    
    private(set) var provider: HQDetailsProviderProtocol
    
    init(provider: HQDetailsProviderProtocol = HQDetailsProvider()) {
        self.provider = provider
    }
    
    func fetchHQ(forId id: Int) {
        provider.fetchHQ(forId: id) { result in
            switch result {
            case .sucess(let details): self.delegate?.didFetchHQDetails(self.mapJSONToModel(json: details))
                break
            case .error(let error): self.delegate?.didGetError(error)
            }
        }
    }
}

extension HQDetailsInteractor {
    
    private func mapJSONToModel(json: HQDetailsJSONModel) -> HQModel {
        return HQModel(name: json.title,
                       imageURL: json.imageURL,
                       description: json.description,
                       cost: json.cost ?? 0)
    }
}
