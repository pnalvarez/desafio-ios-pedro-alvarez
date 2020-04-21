//
//  CharacterListProvider.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol CharacterListProviderProtocol {
    func getCharacters(offset: Int, completion: @escaping (APIResult<[CharacterJSONModel]>) -> ())
}

class CharacterListProvider: CharacterListProviderProtocol {
    
    private let defaultLimit: Int = 20
    
    func getCharacters(offset: Int, completion: @escaping (APIResult<[CharacterJSONModel]>) -> ()) {
        API.shared.getCharacters(offset: offset, limit: 20) { result in
            completion(result)
        }
    }
}
