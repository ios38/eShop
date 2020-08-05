//
//  Basket.swift
//  eShop
//
//  Created by Maksim Romanov on 03.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation
import Alamofire

protocol BasketRequestFactory {
    func addToBasket(goodId: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<ChangeBasketResult>) -> Void)
    func getBasket(userId: Int, completionHandler: @escaping (AFDataResponse<GetBasketResult>) -> Void)
    func deleteFromBasket(goodId: Int, completionHandler: @escaping (AFDataResponse<ChangeBasketResult>) -> Void)
}

class Basket: AbstractRequestFactory {
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

extension Basket: BasketRequestFactory {
    
    func addToBasket(goodId: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<ChangeBasketResult>) -> Void) {
        let requestModel = AddToBasket(baseUrl: baseUrl, goodId: goodId, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getBasket(userId: Int, completionHandler: @escaping (AFDataResponse<GetBasketResult>) -> Void) {
        let requestModel = GetBasket(baseUrl: baseUrl, userId: userId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func deleteFromBasket(goodId: Int, completionHandler: @escaping (AFDataResponse<ChangeBasketResult>) -> Void) {
        let requestModel = DeleteFromBasket(baseUrl: baseUrl, goodId: goodId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Basket {
    struct GetBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        //let path: String = "getBasket.json"
        let path: String = "getBasket"
        let userId: Int
        var parameters: Parameters? {
            return [
                "id_user": userId
            ]
        }
    }
    
    struct AddToBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        //let path: String = "addToBasket.json"
        let path: String = "addToBasket"
        let goodId: Int
        let quantity: Int
        var parameters: Parameters? {
            return [
                "id_product": goodId,
                "quantity": quantity
            ]
        }
    }

    struct DeleteFromBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        //let path: String = "deleteFromBasket.json"
        let path: String = "deleteFromBasket"
        let goodId: Int
        var parameters: Parameters? {
            return [
                "id_product": goodId
            ]
        }
    }

}
