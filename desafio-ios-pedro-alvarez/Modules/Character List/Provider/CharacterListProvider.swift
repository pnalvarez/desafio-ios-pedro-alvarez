//
//  CharacterListProvider.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import RxSwift

protocol CharacterListProviderProtocol {
    func getCharacters(offset: Int, completion: @escaping (APIResult<[CharacterJSONModel]>) -> ())
}

class CharacterListProvider: CharacterListProviderProtocol {
    
    private let defaultLimit: Int = 20
    private let disposeBag = DisposeBag()
    
    func getCharacters(offset: Int, completion: @escaping (APIResult<[CharacterJSONModel]>) -> ()) {
        let subject = API.shared.charactersSubject
        subject.subscribe(onNext: { characters in
            completion(.sucess(characters))
        }, onError: { error in
            completion(.error(error))
        }).disposed(by: disposeBag)
        API.shared.getCharacters(offset: offset, limit: 20)
    }
}
