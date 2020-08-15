//
//  UserController.swift
//  eShop
//
//  Created by Maksim Romanov on 12.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit
import SnapKit

class UserController: UIViewController {
    var user: User?

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
    
    public func addLoginController() {
        self.view.subviews.forEach({ $0.removeFromSuperview() })
        self.children.forEach({ $0.removeFromParent()})
        
        let loginController = LoginController()
        self.addChild(loginController)
        self.view.addSubview(loginController.view)
        loginController.didMove(toParent: self)
        
        loginController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public func addUserInfoController(user: User) {
        self.view.subviews.forEach({ $0.removeFromSuperview() })
        self.children.forEach({ $0.removeFromParent()})
        
        let userInfoController = UserInfoController(user: user)
        self.addChild(userInfoController)
        self.view.addSubview(userInfoController.view)
        userInfoController.didMove(toParent: self)
        
        userInfoController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}