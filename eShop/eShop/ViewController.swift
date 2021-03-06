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
    //var auth: AuthRequestFactory?
    //var registration: RegistrationRequestFactory?
    //var goods: GoodsRequestFactory?
    //var reviews: ReviewsRequestFactory?
    var basket: BasketRequestFactory?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let requestFactory = RequestFactory()
        /*
        self.registration = requestFactory.makeRegistrationRequestFactory()
        guard let registration = self.registration else { return }
        
        registration.register(userName: "Max", password: "123") { response in
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
        }
        
        auth.logout(userId: 123) { response in
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

        goods.getGoods(page: 1, category:1) { response in
            switch response.result {
            case .success(let catalog):
                print(catalog)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }*/
        /*
        goods.getGoodById(goodId: 123) { response in
            switch response.result {
            case .success(let good):
                print(good)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }*/
        /*
        self.reviews = requestFactory.makeReviewsRequestFactory()
        guard let reviews = self.reviews else { return }
        
        reviews.getReviews(goodId: 123) { response in
            switch response.result {
            case .success(let good):
                print(good)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }*/
        /*
        reviews.addReview(goodId: 123, review:"Отличный товар!") { response in
            switch response.result {
            case .success(let good):
                print(good)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }*/
        /*
        reviews.removeReview(reviewId: 123) { response in
            switch response.result {
            case .success(let good):
                print(good)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }*/
        
        //self.basket = requestFactory.makeBasketRequestFactory()
        //guard let basket = self.basket else { return }
        /*
        basket.addToBasket(goodId: 123, quantity: 1) { response in
            switch response.result {
            case .success(let good):
                print(good)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }*/
        /*
        basket.getBasket(userId: 123) { response in
            switch response.result {
            case .success(let good):
                print(good)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }*/
        /*
        basket.deleteFromBasket(goodId: 123) { response in
            switch response.result {
            case .success(let good):
                print(good)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }*/

    }
}
