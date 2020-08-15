//
//  ProductInfoView.swift
//  eShop
//
//  Created by Maksim Romanov on 15.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit

class ProductInfoView: UIView {
    var productImageView = UIImageView(image: UIImage(systemName: "gift.fill"))
    var productNameLabel = UILabel()
    var productPriceLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureSubviews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureSubviews() {
        //self.backgroundColor = .darkGray
        
        self.productImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.productImageView)

        self.productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.productNameLabel)
        
        self.productPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.productPriceLabel.textColor = .lightGray
        self.addSubview(self.productPriceLabel)

    }

    func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(55)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.top)
            make.leading.equalTo(productImageView.snp.trailing).offset(20)
        }
        
        productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(productImageView.snp.trailing).offset(20)
        }
        
        self.snp.makeConstraints { make in
            make.bottom.equalTo(productPriceLabel.snp.bottom).offset(20)
        }

    }
}
