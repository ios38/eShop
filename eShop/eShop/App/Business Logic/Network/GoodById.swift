//
//  Goods.swift
//  eShop
//
//  Created by Maksim Romanov on 25.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation
import Alamofire

protocol GoodsRequestFactory {
    func getGoodById(goodId: String, completionHandler: @escaping (AFDataResponse<GoodResult>) -> Void)
}

class Goods: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let session: Session
    let queue: DispatchQueue?
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        session: Session,
        queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.session = session
        self.queue = queue
    }
}

extension Goods: GoodsRequestFactory {
    func getGoodById(goodId: String, completionHandler: @escaping (AFDataResponse<GoodResult>) -> Void) {
        let requestModel = GoodById(baseUrl: baseUrl, goodId: goodId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Goods {
    struct GoodById: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        let goodId: String
        var parameters: Parameters? {
            return [
                "id_product": goodId
            ]
        }
    }
}
