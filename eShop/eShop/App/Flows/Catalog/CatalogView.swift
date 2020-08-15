//
//  CatalogView.swift
//  eShop
//
//  Created by Maksim Romanov on 11.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit
import SnapKit

class CatalogView: UIView {
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
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.text = "Catalog"
        self.titleLabel.textColor = .lightGray
        self.addSubview(self.titleLabel)

        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        //self.tableView.backgroundColor = .darkGray
        self.addSubview(self.tableView)

    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            //make.centerX.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(55)
        }

    }
}
