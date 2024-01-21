//
//  NetworkModelTest.swift
//  Dragon-Ball-HeroesTests
//
//  Created by Cristian Contreras Velásquez on 20-01-24.
//

import XCTest
@testable import Dragon_Ball_Heroes

final class NetworkModelTest: XCTestCase {
    private var sut: NetworkModel!
    private var expectedToken = "token"
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)
        let client = APIClient(session: session)
        sut = NetworkModel(client: client)
        expectedToken = "token"
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        expectedToken = ""
    }
    
    func test_login() throws {
        // Given
        let tokenData = try XCTUnwrap(expectedToken.data(using:.utf8))
        let (user, password) = ("user", "password")
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = { request in
            let loginString = String(format: "%@:%@", user, password)
            let base64String = loginString.data(using: .utf8)!.base64EncodedString()
            XCTAssertEqual(request.httpMethod,"POST")
            XCTAssertEqual(
                request.value(forHTTPHeaderField: "Authorization"),
                "Basic \(base64String)"
            )
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: URL(string: "https://dragonball.keepcoding.education/")!,
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: ["Content-Type": "application/json"]
                )
            )
            
            return (response,tokenData)
        }
        
        // When
        let expectation = expectation(description: "Login success")
        var receivedToken: String?
        sut.login(
            user: user,
            password: password
        ) { result in
            guard case let .success(token) = result else {
                XCTFail("Expected success but received \(result)")
                return
            }
            receivedToken = token
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertNotNil(receivedToken)
        XCTAssertEqual(receivedToken, expectedToken)
    }
}

