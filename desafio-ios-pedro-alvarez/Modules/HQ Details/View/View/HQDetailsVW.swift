//
//  HQDetailsVW.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class HQDetailsVW: UIView {
    
    private var hqDetailsModel: HQModel?
    
    private(set) lazy var hqImageView: UIImageView = { return UIImageView(frame: .zero) }()
    private(set) lazy var hqNameLbl: UILabel = { return UILabel(frame: .zero) }()
    private(set) lazy var hqDescriptionLbl: UILabel = { return UILabel(frame: .zero) }()
    private(set) lazy var hqCostHeaderLbl: UILabel = { return UILabel(frame: .zero) }()
    private(set) lazy var hqCostLbl: UILabel = { return UILabel(frame: .zero) }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(hqModel: HQModel) {
        self.hqDetailsModel = hqModel
        buildViewCode()
    }
}

extension HQDetailsVW: ViewCodeProtocol {
    
    func buildHierarchy() {
        addSubview(hqImageView)
        addSubview(hqNameLbl)
        addSubview(hqDescriptionLbl)
        addSubview(hqCostHeaderLbl)
        addSubview(hqCostLbl)
    }
    
    func setupConstraints() {
        hqImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(frame.size.height / 3)
        }
        hqNameLbl.snp.makeConstraints { make in
            make.top.equalTo(hqImageView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(frame.size.width)
            make.height.equalTo(30)
        }
        hqDescriptionLbl.snp.makeConstraints { make in
            make.top.equalTo(hqNameLbl.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(frame.size.width * 4/5)
            make.height.equalTo(180)
        }
        hqCostHeaderLbl.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(30)
            make.width.height.equalTo(50)
            make.left.equalToSuperview().inset(50)
        }
        hqCostHeaderLbl.snp.makeConstraints { make in
            make.left.equalTo(hqCostHeaderLbl.snp.right).offset(10)
            make.bottom.equalToSuperview().inset(30)
            make.width.height.equalTo(50)
        }
    }
    
    func configureViews() {
        backgroundColor = .white
        hqImageView.setNeedsLayout()
        hqImageView.contentMode = .scaleToFill
        hqImageView.isUserInteractionEnabled = false
        hqImageView.sd_setImage(with: URL(string: hqDetailsModel?.imageURL ?? .empty), completed: nil)
        
        hqNameLbl.text = hqDetailsModel?.name
        hqNameLbl.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        hqNameLbl.textAlignment = .center
        hqNameLbl.numberOfLines = 3
        hqNameLbl.isUserInteractionEnabled = false
        hqNameLbl.textColor = .black
        
        hqDescriptionLbl.text = hqDetailsModel?.description
        hqDescriptionLbl.textAlignment = .center
        hqDescriptionLbl.font = UIFont(name: "HelveticaNeue-Regular", size: 15)
        hqDescriptionLbl.isUserInteractionEnabled = false
        hqDescriptionLbl.textColor = .black
        hqDescriptionLbl.numberOfLines = 3
        
        hqCostHeaderLbl.text = "R$"
        hqCostHeaderLbl.textAlignment = .center
        hqCostHeaderLbl.textColor = .green

        guard let cost = hqDetailsModel?.cost else { return }
        hqCostLbl.text = "\(cost)"
    }
}
