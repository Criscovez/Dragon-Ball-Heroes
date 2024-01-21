//
//  Dragon_Ball_HeroesTests.swift
//  Dragon-Ball-HeroesTests
//
//  Created by Cristian Contreras Velásquez on 12-01-24.
//

import XCTest
@testable import Dragon_Ball_Heroes

final class Dragon_Ball_HeroesTests: XCTestCase {
    private var token: String?
    
    override func setUp() {
        super.setUp()
        print("SetUp para cada test")
    }
    
    override class func setUp() {
        super.setUp()
        print("SetUp para toda la clase")
    }
    
    override func tearDown() {
        super.tearDown()
        print("TearDown para cada test")
    }
    
    override class func tearDown() {
        super.tearDown()
        print("TearDown para toda la clase")
    }
    
    func test_helloWorld() {
        token = "Hello World!"
        
        XCTAssertEqual(token, "Hello World!")
        XCTAssertNotEqual(token, "Hola Mundo!")
        
    }
    

    func test_hotHelloWord() {
        XCTAssertNil(token)
        
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
