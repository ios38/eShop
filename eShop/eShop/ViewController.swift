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
    var registration: RegistrationRequestFactory?
    var goods: GoodsRequestFactory?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestFactory = RequestFactory()
        /*
        self.registration = requestFactory.makeRegistrationRequestFactory()
        guard let registration = self.registration else { return }
        
        registration.register(userName: "user", password: "password", email: "user@gmail.com") { response in
            switch response.result {
            case .success(let registration):
                print(registration)
            case .failure(let error):
                print(error.localizedDescription)
            }

        }*/
        /*
        self.auth = requestFactory.makeAuthRequestFactory()
        guard let auth = self.auth else { return }

        auth.login(userName: "user", password: "password") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }*/
        /*
        auth.logout(userId: "123") { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }*/
        /*
        self.goods = requestFactory.makeGoodsRequestFactory()
        guard let goods = self.goods else { return }

        goods.getGoodById(goodId: "1") { response in
            switch response.result {
            case .success(let catalog):
                print(catalog)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }*/

    }
    
}
