//
//  GenericErrorVW.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class GenericErrorVW: UIView {
    
    private(set) lazy var messageLbl: UILabel = { return UILabel(frame: .zero) }()
    private(set) lazy var errorImageView: UIImageView = { return UIImageView(frame: .zero) }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("could not load")
    }
}

extension GenericErrorVW: ViewCodeProtocol {
    
    func buildHierarchy() {
        addSubview(messageLbl)
        addSubview(errorImageView)
    }
    
    func setupConstraints() {
        errorImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(70)
        }
        messageLbl.snp.makeConstraints { make in
            make.top.equalTo(errorImageView.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
    }
    
    func configureViews() {
        errorImageView.image = UIImage(named: "warning")
        errorImageView.contentMode = .scaleToFill
        
        messageLbl.text = "Erro genérico"
        messageLbl.textAlignment = .center
        messageLbl.font = UIFont(name: "HelveticaNeue-Regular", size: 18)
        messageLbl.textColor = .black
        
        backgroundColor = .white
    }
}
