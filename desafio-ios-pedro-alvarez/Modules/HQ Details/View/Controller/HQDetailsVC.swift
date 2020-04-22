//
//  HQDetailsVC.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class HQDetailsVC: UIViewController {
    
    private let hqDetailsView = HQDetailsVW()
    
    var presenter: HQDetailsPresenterProtocol?
    
    var coordinator: HQDetailsCoordinator?
    
    private(set) lazy var activityIndicator: UIActivityIndicatorView = { return UIActivityIndicatorView(frame: .zero) }()
    
    private(set) lazy var errorView: GenericErrorVW = { return GenericErrorVW(frame: .zero) }()
    
    override func viewDidLoad() {
        title = presenter?.title
        buildViewCode()
        activityIndicator.isHidden = false
        presenter?.fetch()
    }
}

extension HQDetailsVC: HQDetailsPresenterDelegate {
    
    func updateUI() {
        guard let hqModel = presenter?.hqModel else { return }
        activityIndicator.isHidden = true
        hqDetailsView.setup(hqModel: hqModel)
    }
    
    func didGetError() {
        activityIndicator.isHidden = true
        errorView.isHidden = false
    }
}

extension HQDetailsVC: ViewCodeProtocol {
    
    func buildHierarchy() {
        view.addSubview(hqDetailsView)
        view.addSubview(activityIndicator)
        view.addSubview(errorView)
    }
    
    func setupConstraints() {
        hqDetailsView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.bottom.equalToSuperview()
        }
        activityIndicator.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        errorView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureViews() {
        activityIndicator.backgroundColor = .white
        activityIndicator.color = .black
        activityIndicator.style = .medium
        activityIndicator.startAnimating()
        activityIndicator.isHidden = true
        
        errorView.isHidden = true
    }
}
