//
//  LoadingTVC.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit
import SnapKit

class LoadingTVC: UITableViewCell {
    
    private(set) lazy var activityIndicator: UIActivityIndicatorView = { return UIActivityIndicatorView(frame: .zero)}()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        buildViewCode()
    }
}

extension LoadingTVC: ViewCodeProtocol {
    
    func buildHierarchy() {
        addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        activityIndicator.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureViews() {
        activityIndicator.style = .medium
        activityIndicator.backgroundColor = .black
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        
        isUserInteractionEnabled = false
    }
}
