//
//  Catalog.swift
//  eShop
//
//  Created by Maksim Romanov on 25.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation
import Alamofire

protocol CatalogRequestFactory {
    func getCatalog(page: Int, category: Int, completionHandler: @escaping (AFDataResponse<CatalogResult>) -> Void)
    func getProductById(productId: Int, completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void)
}

class Catalog: AbstractRequestFactory {
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

extension Catalog: CatalogRequestFactory {
    func getCatalog(page: Int, category: Int, completionHandler: @escaping (AFDataResponse<CatalogResult>) -> Void) {
        let requestModel = Catalog(baseUrl: baseUrl, page: page, category: category)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func getProductById(productId: Int, completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void) {
        let requestModel = ProductById(baseUrl: baseUrl, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Catalog {
    struct Catalog: RequestRouter {
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

    struct ProductById: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        //let path: String = "getGoodById.json"
        let path: String = "getGoodById"
        let productId: Int
        var parameters: Parameters? {
            return [
                "id_product": productId
            ]
        }
    }
}
