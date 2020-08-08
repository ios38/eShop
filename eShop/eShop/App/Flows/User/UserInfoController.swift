//
//  UserInfoController.swift
//  eShop
//
//  Created by Maksim Romanov on 08.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit

class UserInfoController: UIViewController {
    var user: User
    var userInfoView = UserInfoView()
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = userInfoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "User Info"
        self.userInfoView.loginTextField.text = self.user.login
        self.userInfoView.nameTextField.text = self.user.name
        self.userInfoView.lastNametTextField.text = self.user.lastname
        
        self.userInfoView.saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
    }
    
    @objc func saveButtonAction() {
        UIView.animate(withDuration: 0.1,
        animations: {
            self.userInfoView.saveButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.userInfoView.saveButton.alpha = 0.7
        },
        completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.userInfoView.saveButton.transform = CGAffineTransform.identity
                self.userInfoView.saveButton.alpha = 1
            }
        })
    }

}
