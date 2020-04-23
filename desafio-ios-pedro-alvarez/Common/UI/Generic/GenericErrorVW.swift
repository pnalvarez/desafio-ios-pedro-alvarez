//
//  GenericErrorVW.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class GenericErrorVW: UIView {
    
    private var errorMessage: String?
    private var retry: SimpleCallbackType?
    
    private(set) lazy var messageLbl: UILabel = { return UILabel(frame: .zero) }()
    private(set) lazy var errorImageView: UIImageView = { return UIImageView(frame: .zero) }()
    private(set) lazy var retryButton: UIButton = { return UIButton(frame: .zero) }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("could not load")
    }
    
    func setup(errorMessage: String, retry: @escaping SimpleCallbackType) {
        self.errorMessage = errorMessage
        self.retry = retry
        buildViewCode()
    }
}

extension GenericErrorVW {
    
    @objc
    private func retryButtonClicked() {
        guard let retry = self.retry else { return }
        retry()
    }
}

extension GenericErrorVW: ViewCodeProtocol {
    
    func buildHierarchy() {
        addSubview(messageLbl)
        addSubview(errorImageView)
        addSubview(retryButton)
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
        retryButton.snp.makeConstraints { make in
            make.top.equalTo(messageLbl.snp.bottom).offset(15)
            make.width.equalTo(70)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
    }
    
    func configureViews() {
        errorImageView.image = UIImage(named: "warning")
        errorImageView.contentMode = .scaleToFill
        
        messageLbl.text = errorMessage
        messageLbl.textAlignment = .center
        messageLbl.font = UIFont(name: "HelveticaNeue-Regular", size: 18)
        messageLbl.textColor = .black
        
        retryButton.setTitle("Reiniciar", for: .normal)
        retryButton.backgroundColor = .blue
        retryButton.setTitleColor(.white, for: .normal)
        retryButton.layer.cornerRadius = 5
        retryButton.addTarget(self, action: #selector(retryButtonClicked), for: .touchUpInside)
        
        backgroundColor = .white
    }
}
