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
    var auth: AuthRequestFactory?
    let requestFactory = RequestFactory()

    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        print("UserInfoController deinitialized")
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
        self.auth = requestFactory.makeAuthRequestFactory()

        self.navigationItem.title = "User Info"
        self.userInfoView.loginTextField.text = self.user.login
        self.userInfoView.nameTextField.text = self.user.name
        self.userInfoView.lastNametTextField.text = self.user.lastname
        
        self.userInfoView.saveButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.userInfoView.logoutButton.addTarget(self, action: #selector(logoutButtonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton) {
        UIView.animate(withDuration: 0.1,
        animations: {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            sender.alpha = 0.7
        },
        completion: { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = CGAffineTransform.identity
                sender.alpha = 1
            }
        })
    }
    
    @objc func logoutButtonAction() {
        guard let auth = self.auth else { return }
        auth.logout(userId: 123) { response in
            switch response.result {
            case .success(let data):
                if data.result == 1 {
                    UserSession.shared.user = nil
                }
                //guard data.result == 1, let parent = self.parent as? UserController else { return }
                //UserSession.shared.user = nil
                //parent.addLoginController()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
