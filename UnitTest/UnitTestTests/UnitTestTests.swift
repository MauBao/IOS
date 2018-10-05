//
//  UnitTestTests.swift
//  UnitTestTests
//
//  Created by Bao Ngo Mau on 10/5/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import XCTest
@testable import UnitTest

class UnitTestTests: XCTestCase {
    
    var viewController: ViewController!
    
    // duoc goi trc khi thuc thi cac ham test
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        viewController = storyboard.instantiateInitialViewController() as! ViewController

    }
    
    // duoc goi sau khi thuc thi cac ham test
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMultiplyFunction() {
        let multi = viewController.multiply(num1: 12, num2: 10)
        XCTAssert(multi == 22)
    }
    
    func testShowResultFunction() {
        let _ = viewController.view // additional code
        viewController.showResult(result: "120.0")
        
        XCTAssert(viewController.resultLabel.text == "120.0", "resultLabel show the wrong text")
    }
}
