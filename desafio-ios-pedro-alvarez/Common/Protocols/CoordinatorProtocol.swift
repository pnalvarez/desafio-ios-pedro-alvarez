//
//  CoordinatorProtocol.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController? { get set }
    var parent: CoordinatorProtocol? { get set}
    var children: [CoordinatorProtocol] { get set}
    
    init(navigationController: UINavigationController)
    func start()
}
