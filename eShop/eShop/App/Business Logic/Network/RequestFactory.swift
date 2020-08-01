//
//  RequestFactory.swift
//  eShop
//
//  Created by Maksim Romanov on 19.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSessionManager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.timeoutIntervalForRequest = 30
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, session: commonSessionManager, queue: sessionQueue)
    }
    
    func makeRegistrationRequestFactory() -> RegistrationRequestFactory {
        let errorParser = makeErrorParser()
        return Registration(errorParser: errorParser, session: commonSessionManager, queue: sessionQueue)
    }

    func makeGoodsRequestFactory() -> GoodsRequestFactory {
        let errorParser = makeErrorParser()
        return Goods(errorParser: errorParser, session: commonSessionManager, queue: sessionQueue)
    }
    
    func makeReviewsRequestFactory() -> ReviewsRequestFactory {
        let errorParser = makeErrorParser()
        return Reviews(errorParser: errorParser, session: commonSessionManager, queue: sessionQueue)
    }

}
