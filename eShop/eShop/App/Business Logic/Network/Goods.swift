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
    func getGoods(page: Int, category: Int, completionHandler: @escaping (AFDataResponse<GoodsResult>) -> Void)
    func getGoodById(goodId: Int, completionHandler: @escaping (AFDataResponse<GoodResult>) -> Void)
}

class Goods: AbstractRequestFactory {
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

extension Goods: GoodsRequestFactory {
    func getGoods(page: Int, category: Int, completionHandler: @escaping (AFDataResponse<GoodsResult>) -> Void) {
        let requestModel = Goods(baseUrl: baseUrl, page: page, category: category)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func getGoodById(goodId: Int, completionHandler: @escaping (AFDataResponse<GoodResult>) -> Void) {
        let requestModel = GoodById(baseUrl: baseUrl, goodId: goodId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Goods {
    struct Goods: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        //let path: String = "catalogData.json"
        let path: String = "catalogData"
        let page: Int
        let category: Int
        var parameters: Parameters? {
            return [
                "page_number": page,
                "id_category": category
            ]
        }
    }

    struct GoodById: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        //let path: String = "getGoodById.json"
        let path: String = "getGoodById"
        let goodId: Int
        var parameters: Parameters? {
            return [
                "id_product": goodId
            ]
        }
    }
}
