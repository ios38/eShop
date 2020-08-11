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
    
    deinit {
        print("LoginController deinitialized")
    }

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
                UserSession.shared.user = login.user
                
                let tabBarController = TabBarController()
                tabBarController.modalPresentationStyle = .fullScreen
                
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let sceneDelegate = windowScene.delegate as? SceneDelegate
                else {
                  return
                }
                
                sceneDelegate.window?.rootViewController = tabBarController
                self.present(tabBarController, animated: true, completion: nil)

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
