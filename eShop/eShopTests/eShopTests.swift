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
    
    func testGetGoods() {
        let goods = Goods(errorParser: errorParser, session: Session())
        goods.getGoods(page: 1, category: 1) { [weak self] (response: AFDataResponse<GoodsResult>) in
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

    func testGetGoodById() {
        let goods = Goods(errorParser: errorParser, session: Session())
        goods.getGoodById(goodId: 123) { [weak self] (response: AFDataResponse<GoodResult>) in
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
        reviews.getReviews(goodId: 123) { [weak self] (response: AFDataResponse<GetReviewsResult>) in
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
        reviews.addReview(goodId: 123, review:"Отличный товар!") { [weak self] (response: AFDataResponse<AddReviewResult>) in
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

}
