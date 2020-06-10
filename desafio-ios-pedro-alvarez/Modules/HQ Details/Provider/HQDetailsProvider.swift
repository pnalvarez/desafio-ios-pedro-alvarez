//
//  HQDetailsProvider.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import RxSwift

protocol HQDetailsProviderProtocol {
    func fetchHQ(forId id: Int, completion: @escaping (APIResult<HQDetailsJSONModel>) -> ())
}

final class HQDetailsProvider: HQDetailsProviderProtocol {
    
    private let disposeBag = DisposeBag()
    
    func fetchHQ(forId id: Int, completion: @escaping (APIResult<HQDetailsJSONModel>) -> ()) {
        let subject = API.shared.hqsSubject
        subject.subscribe(onNext: { characters in
            completion(.sucess(characters))
        }, onError: { error in
            completion(.error(error))
        }).disposed(by: disposeBag)
        
        API.shared.getHQs(characterId: id)
    }
}
