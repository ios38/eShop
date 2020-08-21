//
//  eShopUITests.swift
//  eShopUITests
//
//  Created by Maksim Romanov on 18.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import XCTest
@testable import eShop

//swiftlint:disable type_name

class eShopUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testLogin() throws {
        
        let app = XCUIApplication()
        app.launch()


        let userTabBarButton = app.tabBars.buttons["User"]
        userTabBarButton.tap()
        //let loginTextField = app.textFields["Login"]
        
        let userLoginTextField = app.textFields["userLoginTextField"]
        userLoginTextField.tap()
        userLoginTextField.typeText("user")
        
        let userPasswordTextField = app.secureTextFields["userPasswordTextField"]
        userPasswordTextField.tap()
        userPasswordTextField.typeText("123")
        
        app.buttons["userLoginButton"].tap()

        //let delayExpectation = expectation(description: "Waiting for server response")
        //DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        //    delayExpectation.fulfill()
        //}
        //waitForExpectations(timeout: 3)
        
        XCTAssertTrue(app.buttons["userLogoutButton"].waitForExistence(timeout: 1))

    }
}
