//
//  LoadingTVCBuilder.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class LoadingTVCBuilder: TVCBuilderProtocol {
    
    private let height: CGFloat = 80
    
    func cellHeight() -> CGFloat {
        return height
    }
    
    func cellAt(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath, type: LoadingTVC.self)
        cell.setup()
        
        return cell
    }
}
