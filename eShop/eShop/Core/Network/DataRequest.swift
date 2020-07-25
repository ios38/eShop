//
//  DataRequest.swift
//  eShop
//
//  Created by Maksim Romanov on 19.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation
import Alamofire

protocol AbstractRequestFactory {
    var errorParser: AbstractErrorParser { get }
    var session: Session { get }
    var queue: DispatchQueue? { get }
    
    @discardableResult
    func request<T: Decodable>(
        request: URLRequestConvertible,
        completionHandler: @escaping (AFDataResponse<T>) -> Void)
        -> DataRequest
}

extension AbstractRequestFactory {
    
    @discardableResult
    public func request<T: Decodable>(
        request: URLRequestConvertible,
        completionHandler: @escaping (AFDataResponse<T>) -> Void)
        -> DataRequest {
            return session
                .request(request)
                .responseDecodable(completionHandler: completionHandler)
    }
}
/*
extension DataRequest {
    
    @discardableResult
    func responseCodable<T: Decodable>(errorParser: AbstractErrorParser,
                                       queue: DispatchQueue? = nil,
                                       completionHandler: @escaping (AFDataResponse<T>) -> Void) -> Self {
        
            let responseSerializer = DataResponseSerializer<T> { request, response, data, error in
                //print(request ?? "")
                //print(error ?? "")
                if let error = errorParser.parse(response: response, data: data, error: error) {
                    return .failure(error)
                }
                
                let result = Request.serializeResponseData(response: response, data: data, error: nil)
                
                switch result {
                case .success(let data):
                    do {
                        let value = try JSONDecoder().decode(T.self, from: data)
                        return .success(value)
                    } catch {
                        let customError = errorParser.parse(error)
                        return .failure(customError)
                    }
                case .failure(let error):
                    let customError = errorParser.parse(error)
                    return .failure(customError)
                }
            }
        
            return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}*/

class CustomDecodableSerializer<T: Decodable>: DataResponseSerializerProtocol {
    private let errorParser: AbstractErrorParser

    init(errorParser: AbstractErrorParser) {
        self.errorParser = errorParser
    }

    func serialize(request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: Error?) throws -> T {
        if let error = errorParser.parse(response: response, data: data, error: error) {
            throw error
        }
        do {
            let data = try DataResponseSerializer().serialize(request: request, response: response, data: data, error: error)
            let value = try JSONDecoder().decode(T.self, from: data)
            return value
        } catch {
            let customError = errorParser.parse(error)
            throw customError
        }
    }
}

extension DataRequest {
    @discardableResult
    func responseCodable<T: Decodable>(
        errorParser: AbstractErrorParser,
        queue: DispatchQueue = .main,
        completionHandler: @escaping (AFDataResponse<T>) -> Void)
        -> Self {
            let responseSerializer = CustomDecodableSerializer<T>(errorParser: errorParser)
            return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}
