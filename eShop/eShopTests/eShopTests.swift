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
        registration.register(userName: "test", password: "123", email: "test@gmail.com") { [weak self] (response: AFDataResponse<RegistrationResult>) in
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
        auth.login(userName: "test", password: "123") { [weak self] (response: AFDataResponse<LoginResult>) in
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
        auth.logout(userId: "123") { [weak self] (response: AFDataResponse<LogoutResult>) in
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
    
    func testGetGoodById() {
        let goods = Goods(errorParser: errorParser, session: Session())
        goods.getGoodById(goodId: "1") { [weak self] (response: AFDataResponse<GoodResult>) in
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
