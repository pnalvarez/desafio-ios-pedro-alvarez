//
//  CharacterListFactory.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

class CharacterListFactory: TVFactoryProtocol {
    
    private(set) var tableView: UITableView
    private(set) var characters: [CharacterModel]
    
    private let totalCells: Int = 1493
    
    init(tableView: UITableView,
         characters: [CharacterModel]) {
        self.tableView = tableView
        self.characters = characters
    }

    func buildSections() -> [TVSectionProtocol] {
        var builders: [TVCBuilderProtocol] = []
        
        builders.append(contentsOf: characterBuilders)
        builders.append(contentsOf: loadingBuilders)
        
        return [BaseSection(builders: builders)]
    }
    
    private var characterBuilders: [TVCBuilderProtocol] {
        var builders: [TVCBuilderProtocol] = []
        
        for character in characters {
            builders.append(CharacterListTVCBuilder(imageURL: character.imageURL, name: character.name))
        }
        return builders
    }
    
    private var loadingBuilders: [TVCBuilderProtocol] {
        var builders: [TVCBuilderProtocol] = []
        
        let total = totalCells - characters.count
        
        for _ in 0...total {
            builders.append(LoadingTVCBuilder())
        }
        return builders
    }
}
