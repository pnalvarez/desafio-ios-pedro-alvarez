//
//  CharacterDetailsVW.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit
import SnapKit

protocol CharacterDetailsVWDelegate: class {
    func hqButtonPressed()
}

class CharacterDetailsVW: UIView {
    
    private(set) var characterModel: CharacterModel?
    
    weak var delegate: CharacterDetailsVWDelegate?
    
    private(set) lazy var characterImageView: UIImageView = { return UIImageView(frame: .zero) }()
    private(set) lazy var nameLbl: UILabel = { return UILabel(frame: .zero) }()
    private(set) lazy var descriptionLbl = { return UILabel(frame: .zero) }()
    private(set) lazy var hqButton = { return UIButton(frame: .zero) }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(characterModel: CharacterModel) {
        self.characterModel = characterModel
        buildViewCode()
    }
}

extension CharacterDetailsVW {
    
    @objc
    private func goToHQPressed() {
        delegate?.hqButtonPressed()
    }
}

extension CharacterDetailsVW: ViewCodeProtocol {
    
    func buildHierarchy() {
        addSubview(characterImageView)
        addSubview(nameLbl)
        addSubview(descriptionLbl)
        addSubview(hqButton)
    }
    
    func setupConstraints() {
        characterImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.width.height.equalTo(150)
            make.centerX.equalToSuperview()
        }
        nameLbl.snp.makeConstraints { make in
            make.top.equalTo(characterImageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(30)
        }
        descriptionLbl.snp.makeConstraints { make in
            make.top.equalTo(nameLbl.snp.bottom).inset(10)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(180)
        }
        hqButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.width.equalTo(110)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
    }
    
    func configureViews() {
        characterImageView.layoutIfNeeded()
        characterImageView.contentMode = .scaleToFill
        characterImageView.layer.borderColor = UIColor.black.cgColor
        characterImageView.layer.borderWidth = 1
//        characterImageView.layer.masksToBounds = false
        characterImageView.clipsToBounds = true
        characterImageView.layer.cornerRadius = characterImageView.frame.size.width / 2
        characterImageView.isUserInteractionEnabled = false
        characterImageView.sd_setImage(with: URL(string: characterModel?.imageURL ?? .empty), completed: nil)
        
        nameLbl.text = characterModel?.name
        nameLbl.textAlignment = .center
        nameLbl.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        nameLbl.numberOfLines = 1
        nameLbl.isUserInteractionEnabled = false
        nameLbl.textColor = .black
        
        descriptionLbl.text = characterModel?.description
        descriptionLbl.textAlignment = .center
        descriptionLbl.font = UIFont(name: "HelveticaNeue-Regular", size: 15)
        descriptionLbl.numberOfLines = 0
        descriptionLbl.isUserInteractionEnabled = false
        descriptionLbl.textColor = .black
        
        hqButton.setTitle("Ir para HQ", for: .normal)
        hqButton.backgroundColor = .orange
        hqButton.setTitleColor(.white, for: .normal)
        hqButton.layer.cornerRadius = 5
        hqButton.addTarget(self, action: #selector(goToHQPressed), for: .touchUpInside)
        
        backgroundColor = .white
    }
}
