//
//  LoginView.swift
//  eShop
//
//  Created by Maksim Romanov on 07.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit

class LoginView: UIView {
    let titleLabel = UILabel()

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
        self.titleLabel.text = "There's nothing here"
        self.titleLabel.textColor = UIColor.lightGray
        self.titleLabel.textAlignment = .center
        self.titleLabel.font = UIFont.systemFont(ofSize: 16.0)
        
        self.addSubview(self.titleLabel)
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50.0),
            self.titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20.0),
            self.titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20.0)
        ])
    }

}
