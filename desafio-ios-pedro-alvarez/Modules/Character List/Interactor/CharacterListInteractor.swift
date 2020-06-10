//
//  CharacterListInteractor.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol CharacterListInteractorProtocol {
    var delegate: CharacterListInteractorDelegate? { get set}
    
    func fetchWithIndex(index: Int)
}

protocol CharacterListInteractorDelegate: class {
    func fetchedCharacters(_ characters: [CharacterModel])
    func didGetError(_ errorType: Error)
}

class CharacterListInteractor: CharacterListInteractorProtocol {
    
    weak var delegate: CharacterListInteractorDelegate?
    
    private(set) var provider: CharacterListProviderProtocol
    
    private(set) var currentOffset: Int = 0
    
    private(set) var characters: [CharacterModel] = []
    
    private let defaultLimit: Int = 20
    
    init(provider: CharacterListProviderProtocol = CharacterListProvider()) {
        self.provider = provider
    }
    
    func fetchWithIndex(index: Int) {
        if index > currentOffset {
            currentOffset += defaultLimit
            fetch(withOffset: index)
        }
    }
}

extension CharacterListInteractor {
    
    private func mapJsonToModel(characters: [CharacterJSONModel]) -> [CharacterModel] {
        var chars: [CharacterModel] = []
        
        for character in characters {
            chars.append(CharacterModel(id: character.id,
                                        name: character.name,
                                        description: character.description,
                                        imageURL: character.thumb))
        }
        return chars
    }
    
    private func fetch(withOffset offset: Int) {
        provider.getCharacters(offset: offset) { result in
            
            switch result {
            case .sucess(let characters): self.characters = self.mapJsonToModel(characters: characters)
            self.delegate?.fetchedCharacters(self.characters)
                break
            case .error(let error): self.delegate?.didGetError(error)
            }
        }
    }
}
