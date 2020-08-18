//
//  BasketView.swift
//  eShop
//
//  Created by Maksim Romanov on 18.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit

class BasketView: UIView {
    let titleView = UIView()
    let titleLabel = UILabel()
    var tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureSubviews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureSubviews() {
        self.titleView.translatesAutoresizingMaskIntoConstraints = false
        //self.titleView.backgroundColor = .darkGray
        self.addSubview(self.titleView)

        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.text = "Basket"
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        //self.titleLabel.textColor = .lightGray
        self.addSubview(self.titleLabel)

        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        //self.tableView.backgroundColor = .darkGray
        self.addSubview(self.tableView)

    }
    
    func setupConstraints() {
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(64)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.centerX.equalToSuperview()
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.titleView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(55)
        }

    }
}
