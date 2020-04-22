//
//  CharacterListVC.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class CharacterListVC: UIViewController {
    
    let tableView = CharacterListTV()
    
    private(set) var dataSource: DefaultTVOutput?
    private(set) var factory: CharacterListFactory?
    
    var presenter: CharacterListPresenterProtocol?
    var coordinator: CharacterListCoordinator?
    
    override func viewDidLoad() {
        setupNavigation()
        refreshList()
    }
    
    override func loadView() {
        view = tableView
    }
}

extension CharacterListVC {
    
    private func setupNavigation() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: .empty, style: .plain, target: nil, action: nil)
        title = presenter?.title
    }
    
    private func setupFactory() {
        guard let characters = presenter?.characters else {
            return
        }
        factory = CharacterListFactory(tableView: tableView,
                                       characters: characters)
    }
    
    private func setupDataSource() {
        guard let sections = factory?.buildSections() else {
            return
        }
        dataSource = DefaultTVOutput(sections: sections)
        dataSource?.delegate = self
    }
    
    private func setupTableView() {
        tableView.registerCell(cellType: LoadingTVC.self)
        tableView.registerCell(cellType: CharacterListTVC.self)
        
        guard let dataSource = self.dataSource else {
            return
        }
        
        tableView.assignProtocols(to: dataSource)
    }
    
    private func refreshList() {
        setupFactory()
        setupDataSource()
        setupTableView()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension CharacterListVC: CharacterListPresenterDelegate {
    
    func updateUI() {
        refreshList()
    }
    
    func displayError() {
        
    }
}

extension CharacterListVC: DefaultTVOutputDelegate {
    
    func didSelectCell(at indexPath: IndexPath) {
        guard let characterModel = presenter?.characters[indexPath.row] else { return }
        coordinator?.startDetails(characterModel: characterModel)
    }
    
    func cellWillDisplay(at indexPath: IndexPath) {
        presenter?.cellWillDisplay(index: indexPath.row)
    }
}
