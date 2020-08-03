//
//  Registration.swift
//  eShop
//
//  Created by Maksim Romanov on 20.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//
import Foundation
import Alamofire
//swiftlint:disable vertical_parameter_alignment

protocol RegistrationRequestFactory {
    func register(userName: String,
                  password: String,
                  completionHandler: @escaping (AFDataResponse<RegistrationResult>) -> Void)
}

class Registration: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let session: Session
    let queue: DispatchQueue?
    //let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    let baseUrl = URL(string: "http://127.0.0.1:8080/")!

    init(
        errorParser: AbstractErrorParser,
        session: Session,
        queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.session = session
        self.queue = queue
    }
}

extension Registration: RegistrationRequestFactory {
    func register(userName: String,
                  password: String,
         completionHandler: @escaping (AFDataResponse<RegistrationResult>) -> Void) {
        let requestModel = Registration(baseUrl: baseUrl, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Registration {
    struct Registration: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        //let path: String = "registerUser.json"
        let path: String = "register"

        let login: String
        let password: String
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }
}
