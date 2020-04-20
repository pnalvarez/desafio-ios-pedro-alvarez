//
//  ViewCodeProtocol.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol ViewCodeProtocol {
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCodeProtocol {
    
    func configureViews() {
        
    }
    
    func buildViewCode() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
}
