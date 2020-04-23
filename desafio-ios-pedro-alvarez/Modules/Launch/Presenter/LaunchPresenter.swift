//
//  LaunchPresenter.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 22/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit


protocol LaunchPresenterProtocol {
    func viewDidLoad()
}

protocol LaunchPresenterDelegate: class {
    func didGetTime()
}

class LaunchPresenter: LaunchPresenterProtocol {
    
    weak var delegate: LaunchPresenterDelegate?
    
    func viewDidLoad() {
         DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.delegate?.didGetTime()
        }
    }
}

