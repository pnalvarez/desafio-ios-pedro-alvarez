//
//  CharacterListTVCBuilder.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class CharacterListTVCBuilder: TVCBuilderProtocol {
    
    private let imageURL: String
    private let name: String
    private let height: CGFloat = 80
    
    init(imageURL: String,
         name: String) {
        self.imageURL = imageURL
        self.name = name
    }
    
    func cellHeight() -> CGFloat {
        return height
    }
    
    func cellAt(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath, type: CharacterListTVC.self)
        cell.setup(imageURL: imageURL, name: name)
        
        return cell
    }
}
