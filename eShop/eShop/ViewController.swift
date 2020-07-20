//
//  ViewController.swift
//  eShop
//
//  Created by Maksim Romanov on 19.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    var auth: AuthRequestFactory?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestFactory = RequestFactory()

        self.auth = requestFactory.makeAuthRequestFactory()
        guard let auth = self.auth else { return }

        auth.login(userName: "user", password: "password") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        auth.logout(userId: "123") { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
    
}
