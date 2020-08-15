//
//  ProductReviewsView.swift
//  eShop
//
//  Created by Maksim Romanov on 15.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit

class ProductReviewsView: UIView {
    var reviewsTitleLabel = UILabel()
    var reviewsTableView = UITableView()

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
        
        self.reviewsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.reviewsTitleLabel.text = "Product Reviews"
        self.reviewsTitleLabel.textColor = .lightGray
        self.addSubview(self.reviewsTitleLabel)
        
        self.reviewsTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.reviewsTableView)

    }

    func setupConstraints() {
        reviewsTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(15)
        }
        
        reviewsTableView.snp.makeConstraints { make in
            make.top.equalTo(reviewsTitleLabel.snp.bottom).offset(10)
            make.bottom.leading.trailing.equalToSuperview()
        }

    }
}
