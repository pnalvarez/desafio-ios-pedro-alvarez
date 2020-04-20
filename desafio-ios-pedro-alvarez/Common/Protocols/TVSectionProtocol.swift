//
//  TVSectionProtocol.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

protocol TVSectionProtocol {
    var builders: [TVCBuilderProtocol] { get set }
    
    func numberOfRows() -> Int
    func heightForHeader() -> CGFloat
    func headerView() -> UIView?
    func cellHeightFor(indexPath: IndexPath) -> CGFloat
    func cellAt(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell
}
