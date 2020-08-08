//
//  LoginView.swift
//  eShop
//
//  Created by Maksim Romanov on 07.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit
import SnapKit

class LoginView: UIView {
    let loginLabel = UILabel()
    var loginTextField = UITextField()
    let passwordLabel = UILabel()
    var passwordTextField = UITextField()
    let loginButton = UIButton()
    let registerButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureSubviews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        self.loginLabel.translatesAutoresizingMaskIntoConstraints = false
        self.loginLabel.text = "Login"
        self.loginLabel.textColor = .lightGray
        self.addSubview(self.loginLabel)
        
        self.loginTextField.translatesAutoresizingMaskIntoConstraints = false
        self.loginTextField.borderStyle = .roundedRect
        self.loginTextField.placeholder = "Login"
        self.addSubview(self.loginTextField)
        
        self.passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        self.passwordLabel.text = "Password"
        self.passwordLabel.textColor = UIColor.lightGray
        self.addSubview(self.passwordLabel)
        
        self.passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordTextField.borderStyle = .roundedRect
        self.passwordTextField.placeholder = "Password"
        self.addSubview(self.passwordTextField)
        
        self.passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        self.passwordTextField.isSecureTextEntry = true
        self.passwordLabel.text = "Password"
        self.passwordLabel.textColor = .lightGray
        self.addSubview(self.passwordLabel)
        
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.loginButton.setTitle("Login", for: .normal)
        self.loginButton.setTitleColor(.systemBlue, for: .normal)
        self.addSubview(self.loginButton)
        
        self.registerButton.translatesAutoresizingMaskIntoConstraints = false
        self.registerButton.setTitle("Register", for: .normal)
        self.registerButton.setTitleColor(.systemBlue, for: .normal)
        self.addSubview(self.registerButton)

    }
    
    func setupConstraints() {
        loginLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }

        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(self.loginLabel.snp.bottom).offset(20)
            //make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().inset(100)
        }

        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(self.loginTextField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.passwordLabel.snp.bottom).offset(20)
            //make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().inset(100)
        }

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }

        registerButton.snp.makeConstraints { make in
            make.top.equalTo(self.loginButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }

        /*
        let safeArea = self.safeAreaLayoutGuide

         NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50.0),
            self.titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20.0),
            self.titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20.0)
        ])*/
    }

}
