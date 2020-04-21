//
//  CharacterListTVC.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class CharacterListTVC: UITableViewCell {
    
    private(set) var imageURL: String?
    private(set) var name: String?
    
    private(set) lazy var characterPhotoImageView: UIImageView = { return UIImageView(frame: .zero) }()
    private(set) lazy var nameLbl: UILabel = { return UILabel(frame: .zero) }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(imageURL: String,
               name: String) {
        self.imageURL = imageURL
        self.name = name
        buildViewCode()
    }
}

extension CharacterListTVC: ViewCodeProtocol {
    
    func buildHierarchy() {
        addSubview(characterPhotoImageView)
        addSubview(nameLbl)
    }
    
    func setupConstraints() {
        characterPhotoImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(30)
            make.width.height.equalTo(frame.size.height * 2 / 3)
        }
        nameLbl.snp.makeConstraints { make in
            make.centerY.equalTo(characterPhotoImageView.snp.centerY)
            make.height.equalTo(frame.size.height)
            make.right.equalToSuperview()
            make.left.equalTo(characterPhotoImageView.snp.right).offset(15)
        }
    }
    
    func configureViews() {
        characterPhotoImageView.layoutIfNeeded()
        characterPhotoImageView.layer.cornerRadius = characterPhotoImageView.frame.size.width / 2
        characterPhotoImageView.layer.borderWidth = 1
        characterPhotoImageView.layer.borderColor = UIColor.black.cgColor
        characterPhotoImageView.clipsToBounds = true
        characterPhotoImageView.contentMode = .scaleAspectFill
        characterPhotoImageView.isUserInteractionEnabled = false
        characterPhotoImageView.sd_setImage(with: URL(string: imageURL ?? .empty))
        
        nameLbl.text = name
        nameLbl.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        nameLbl.textAlignment = .left
        nameLbl.textColor = .black
        nameLbl.numberOfLines = 3

        selectionStyle = .none
        isUserInteractionEnabled = true
    }
}
