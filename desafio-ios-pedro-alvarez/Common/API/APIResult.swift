//
//  APIResult.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 10/06/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

enum APIResult<T> {
    case sucess(T)
    case error(Error)
}
