//
//  UITableView+Extension.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

extension UITableView {
    
    func assignProtocols(to output: TableViewOutput) {
        delegate = output
        dataSource = output
    }
    
    func registerCell<T: UITableViewCell>(cellType: T.Type) {
        register(cellType, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
}
