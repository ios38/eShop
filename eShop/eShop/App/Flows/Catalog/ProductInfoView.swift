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
    var buyButton = UIButton(type: .system)

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
        
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.setTitle("Buy", for: .normal)
        buyButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: 16.0)
        buyButton.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        buyButton.layer.cornerRadius = 15.0
        self.addSubview(self.buyButton)
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
        
        buyButton.snp.makeConstraints { make in
            make.centerY.equalTo(productPriceLabel.snp.centerY)
            make.leading.equalTo(productPriceLabel.snp.trailing).offset(25)
            make.width.equalTo(50)
        }

        self.snp.makeConstraints { make in
            make.bottom.equalTo(productPriceLabel.snp.bottom).offset(20)
        }

    }
}
