//
//  HQDetailsProvider.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol HQDetailsProviderProtocol {
    func fetchHQ(forId id: Int, completion: @escaping (APIResult<HQDetailsJSONModel>) -> ())
}

final class HQDetailsProvider: HQDetailsProviderProtocol {
    
    func fetchHQ(forId id: Int, completion: @escaping (APIResult<HQDetailsJSONModel>) -> ()) {
        API.shared.getHQs(characterId: id) { result in
            completion(result)
        }
    }
}
