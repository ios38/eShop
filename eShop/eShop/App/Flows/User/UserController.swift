//
//  UserController.swift
//  eShop
//
//  Created by Maksim Romanov on 12.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit
import SnapKit
import FirebaseAnalytics

class UserController: UIViewController {
    var user: User?

    override func loadView() {
        super.loadView()
        Analytics.logEvent("load_UserController", parameters: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserSession.shared.isAuth.addObserver(self, options: [.new, .initial], closure: { (user, _) in
            guard let user = UserSession.shared.user else {
                self.addLoginController()
                return
            }
            self.addUserInfoController(user: user)
        })

        if UserSession.shared.user == nil {
            addLoginController()
        }
    }
    
    func addLoginController() {
        self.view.subviews.forEach({ $0.removeFromSuperview() })
        self.children.forEach({ $0.removeFromParent()})
        
        let loginController = LoginController()
        self.addChild(loginController)
        self.view.addSubview(loginController.view)
        loginController.didMove(toParent: self)
        
        loginController.view.translatesAutoresizingMaskIntoConstraints = false
        loginController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        Analytics.logEvent("add_LoginController", parameters: nil)
    }
    
    func addUserInfoController(user: User) {
        self.view.subviews.forEach({ $0.removeFromSuperview() })
        self.children.forEach({ $0.removeFromParent()})
        
        let userInfoController = UserInfoController(user: user)
        self.addChild(userInfoController)
        self.view.addSubview(userInfoController.view)
        userInfoController.didMove(toParent: self)
        
        userInfoController.view.translatesAutoresizingMaskIntoConstraints = false
        userInfoController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        Analytics.logEvent("add_UserInfoController", parameters: nil)
    }

}
