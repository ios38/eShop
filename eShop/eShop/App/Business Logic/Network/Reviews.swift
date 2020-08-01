//
//  Reviews.swift
//  eShop
//
//  Created by Maksim Romanov on 01.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation
import Alamofire

protocol ReviewsRequestFactory {
    func getReviews(goodId: Int, completionHandler: @escaping (AFDataResponse<GetReviewsResult>) -> Void)
    func addReview(goodId: Int, review:String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
    func removeReview(reviewId: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void)
}

class Reviews: AbstractRequestFactory {
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

extension Reviews: ReviewsRequestFactory {
    func getReviews(goodId: Int, completionHandler: @escaping (AFDataResponse<GetReviewsResult>) -> Void) {
        let requestModel = Reviews(baseUrl: baseUrl, goodId: goodId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func addReview(goodId: Int, review:String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, goodId: goodId, review: review)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func removeReview(reviewId: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void) {
        let requestModel = RemoveReview(baseUrl: baseUrl, reviewId: reviewId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

}

extension Reviews {
    struct Reviews: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        //let path: String = ""
        let path: String = "getReviews"
        let goodId: Int
        var parameters: Parameters? {
            return [
                "id_product": goodId
            ]
        }
    }
    
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        //let path: String = "addReview.json"
        let path: String = "addReview"
        let goodId: Int
        let review: String
        var parameters: Parameters? {
            return [
                "id_product": goodId,
                "review": review
            ]
        }
    }

    struct RemoveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        //let path: String = "removeReview.json"
        let path: String = "removeReview"
        let reviewId: Int
        var parameters: Parameters? {
            return [
                "id_review": reviewId
            ]
        }
    }

}
