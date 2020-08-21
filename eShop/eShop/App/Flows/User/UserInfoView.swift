//
//  UserInfo.swift
//  eShop
//
//  Created by Maksim Romanov on 08.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit
import SnapKit

class UserInfoView: UIView {
    let loginLabel = UILabel()
    let passwordLabel = UILabel()
    let nameLabel = UILabel()
    let lastNameLabel = UILabel()
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let nameTextField = UITextField()
    let lastNametTextField = UITextField()
    var saveButton = UIButton()
    var logoutButton = UIButton()

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

        self.passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        self.passwordLabel.text = "Password"
        self.passwordLabel.textColor = .lightGray
        self.addSubview(self.passwordLabel)
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.text = "First Name"
        self.nameLabel.textColor = .lightGray
        self.addSubview(self.nameLabel)
        
        self.lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.lastNameLabel.text = "Last Name"
        self.lastNameLabel.textColor = .lightGray
        self.addSubview(self.lastNameLabel)
        
        self.loginTextField.translatesAutoresizingMaskIntoConstraints = false
        self.loginTextField.borderStyle = .roundedRect
        self.addSubview(self.loginTextField)

        self.passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordTextField.borderStyle = .roundedRect
        self.passwordTextField.isSecureTextEntry = true
        self.addSubview(self.passwordTextField)

        self.nameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.nameTextField.borderStyle = .roundedRect
        self.addSubview(self.nameTextField)

        self.lastNametTextField.translatesAutoresizingMaskIntoConstraints = false
        self.lastNametTextField.borderStyle = .roundedRect
        self.addSubview(self.lastNametTextField)
        
        self.saveButton.translatesAutoresizingMaskIntoConstraints = false
        self.saveButton.setTitle("Save Changes", for: .normal)
        self.saveButton.setTitleColor(.systemBlue, for: .normal)
        self.addSubview(self.saveButton)

        self.logoutButton.translatesAutoresizingMaskIntoConstraints = false
        self.logoutButton.setTitle("Logout", for: .normal)
        self.logoutButton.setTitleColor(.systemBlue, for: .normal)
        self.logoutButton.accessibilityIdentifier = "userLogoutButton"
        self.addSubview(self.logoutButton)
    }
    
    func setupConstraints() {
        loginLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(40)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(40)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(40)
        }

        lastNameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(40)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.centerY.equalTo(self.loginLabel.snp.centerY)
            make.leading.equalToSuperview().offset(150)
            //make.leading.equalTo(lastNameLabel.snp.right).offset(30)
            make.trailing.equalToSuperview().inset(40)
        }

        passwordTextField.snp.makeConstraints { make in
            make.centerY.equalTo(self.passwordLabel.snp.centerY)
            make.leading.equalToSuperview().offset(150)
            //make.leading.equalTo(lastNameLabel.snp.right).offset(30)
            make.trailing.equalToSuperview().inset(40)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.centerY.equalTo(self.nameLabel.snp.centerY)
            make.leading.equalToSuperview().offset(150)
            //make.leading.equalTo(lastNameLabel.snp.right).offset(30)
            make.trailing.equalToSuperview().inset(40)
        }
        
        lastNametTextField.snp.makeConstraints { make in
            make.centerY.equalTo(self.lastNameLabel.snp.centerY)
            make.leading.equalToSuperview().offset(150)
            //make.leading.equalTo(lastNameLabel.snp.right).offset(30)
            make.trailing.equalToSuperview().inset(40)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(self.lastNameLabel.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }

        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(self.saveButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}
