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
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        //self.tableView.backgroundColor = .darkGray
        self.addSubview(self.tableView)

    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(55)
        }

    }
}
