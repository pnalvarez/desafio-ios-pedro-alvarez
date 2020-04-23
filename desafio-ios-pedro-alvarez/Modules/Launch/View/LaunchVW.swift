//
//  LaunchVW.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 22/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class LaunchVW: UIView {
    
    private(set) lazy var imageView: UIImageView = { return UIImageView(frame: .zero) }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LaunchVW: ViewCodeProtocol {
    
    func buildHierarchy() {
        addSubview(imageView)
    }

    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(240)
            make.height.equalTo(128)
        }
    }
}
