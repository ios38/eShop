//
//  eShopTests.swift
//  eShopTests
//
//  Created by Maksim Romanov on 18.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import XCTest
import Alamofire
@testable import eShop
//swiftlint:disable type_name xctfail_message empty_enum_arguments switch_case_alignment

class eShopTests: XCTestCase {
    var errorParser: ErrorParserStub!
    let expectation = XCTestExpectation(description: "Download failed")

    override func setUpWithError() throws {
        super.setUp()
        errorParser = ErrorParserStub()
    }

    override func tearDownWithError() throws {
        super.tearDown()
        errorParser = nil
    }

    func testRegistration() {
        let registration = Registration(errorParser: errorParser, session: Session())
        registration.register(userName: "Max", password: "123") { [weak self] (response: AFDataResponse<RegistrationResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(let data):
                    print("\n\(data)\n")
                    //XCTAssert(true)
                    XCTAssertEqual(data.result, 1)
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

    func testLogin() {
        let auth = Auth(errorParser: errorParser, session: Session())
        auth.login(userName: "Max", password: "123") { [weak self] (response: AFDataResponse<LoginResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(let data):
                    print("\n\(data)\n")
                    XCTAssertEqual(data.result, 1)
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testLogOut() {
        let auth = Auth(errorParser: errorParser, session: Session())
        auth.logout(userId: 123) { [weak self] (response: AFDataResponse<LogoutResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(let data):
                    print("\n\(data)\n")
                    XCTAssertEqual(data.result, 1)
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testGetCatalog() {
        let catalog = Catalog(errorParser: errorParser, session: Session())
        catalog.getCatalog(page: 1, category: 1) { [weak self] (response: AFDataResponse<CatalogResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(let data):
                    print("\n\(data)\n")
                    XCTAssert(data.count > 0)
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

    func testGetProductById() {
        let catalog = Catalog(errorParser: errorParser, session: Session())
        catalog.getProductById(productId: 123) { [weak self] (response: AFDataResponse<ProductResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(let data):
                    print("\n\(data)\n")
                    XCTAssertEqual(data.result, 1)
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testGetReviews() {
        let reviews = Reviews(errorParser: errorParser, session: Session())
        reviews.getReviews(productId: 123) { [weak self] (response: AFDataResponse<GetReviewsResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(let data):
                    print("\n\(data)\n")
                    XCTAssertEqual(data.result, 1)
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testAddReview() {
        let reviews = Reviews(errorParser: errorParser, session: Session())
        reviews.addReview(productId: 123, review: "Отличный товар!") { [weak self] (response: AFDataResponse<AddReviewResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(let data):
                    print("\n\(data)\n")
                    XCTAssertEqual(data.result, 1)
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

    func testRemoveReview() {
        let reviews = Reviews(errorParser: errorParser, session: Session())
        reviews.removeReview(reviewId: 123) { [weak self] (response: AFDataResponse<RemoveReviewResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(let data):
                    print("\n\(data)\n")
                    XCTAssertEqual(data.result, 1)
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testAddToBasket() {
        let basket = Basket(errorParser: errorParser, session: Session())
        basket.addToBasket(productId: 123, quantity: 1) { [weak self] (response: AFDataResponse<ChangeBasketResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(let data):
                    print("\n\(data)\n")
                    XCTAssertEqual(data.result, 1)
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testGetBasket() {
        let basket = Basket(errorParser: errorParser, session: Session())
        basket.getBasket(userId: 123) { [weak self] (response: AFDataResponse<GetBasketResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(let data):
                    print("\n\(data)\n")
                    XCTAssert(true)
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testDeleteFromBasket() {
        let basket = Basket(errorParser: errorParser, session: Session())
        basket.deleteFromBasket(productId: 123) { [weak self] (response: AFDataResponse<ChangeBasketResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(let data):
                    print("\n\(data)\n")
                    XCTAssertEqual(data.result, 1)
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

}
