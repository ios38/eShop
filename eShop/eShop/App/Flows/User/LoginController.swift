//
//  LoginController.swift
//  eShop
//
//  Created by Maksim Romanov on 07.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit
import Alamofire

final class LoginController: UIViewController {
    var loginView = LoginView()
    var auth: AuthRequestFactory?
    let requestFactory = RequestFactory()

    override func loadView() {
        super.loadView()
        self.view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.auth = requestFactory.makeAuthRequestFactory()
        
        self.loginView.loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        self.loginView.registerButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }
    
    @objc func loginButtonAction() {
        guard let login = self.loginView.loginTextField.text, login != "",
              let password = self.loginView.passwordTextField.text, password != "",
              let auth = self.auth
              else { print("login/password data error")
                     return }
        auth.login(userName: "user", password: "password") { response in
            switch response.result {
            case .success(let login):
                //print(login)
                let user = login.user
                let userInfoController = UserInfoController(user: user)
                self.navigationController?.pushViewController(userInfoController, animated: true)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @objc func registerButtonAction() {
        guard let login = self.loginView.loginTextField.text, login != "",
              let password = self.loginView.passwordTextField.text, password != ""
              else { print("login/password data error")
                     return }
        print("login user: \(login) password: \(password)")
    }

}
