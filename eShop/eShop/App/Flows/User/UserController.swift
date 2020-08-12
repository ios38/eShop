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
    //var loginController: LoginController?
    //var userInfoController: UserInfoController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let user = UserSession.shared.user else {
            addLoginController()
            return
        }
        
        addUserInfoController(user: user)
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
        /*
        self.loginController = LoginController()
        guard self.loginController != nil else { return }
        self.addChild(loginController!)
        self.view.addSubview(loginController!.view)
        self.loginController?.didMove(toParent: self)
        
        self.loginController!.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }*/
    }
    
    public func addUserInfoController(user: User) {
        self.view.subviews.forEach({ $0.removeFromSuperview() })
        self.children.forEach({ $0.removeFromParent()})
        //self.loginController = nil
        
        let userInfoController = UserInfoController(user: user)
        self.addChild(userInfoController)
        self.view.addSubview(userInfoController.view)
        userInfoController.didMove(toParent: self)
        
        userInfoController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        /*
        self.userInfoController = UserInfoController(user: user)
        guard self.userInfoController != nil else { return }
        self.addChild(userInfoController!)
        self.view.addSubview(userInfoController!.view)
        self.userInfoController?.didMove(toParent: self)
        
        self.userInfoController!.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }*/
    }

}
