//
//  NetworkingTestAppTests.swift
//  NetworkingTestAppTests
//
//  Created by Majdi Felah on 24/02/2020.
//  Copyright © 2020 Majdi Felah. All rights reserved.
//

import XCTest
@testable import NetworkingTestApp

class HttpClientTests: XCTestCase {
    
    var httpClient: HttpClient!
    let session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        httpClient = HttpClient(session: session)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_get_request_with_URL() {

        guard let url = URL(string: "https://mockurl") else {
            fatalError("URL can't be empty")
        }
        
        httpClient.get(url: url) { (success, response) in
            // Return data
        }
        
        XCTAssert(session.lastURL == url)
        
    }
    
    func test_get_resume_called() {
        
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        
        guard let url = URL(string: "https://mockurl") else {
            fatalError("URL can't be empty")
        }
        
        httpClient.get(url: url) { (success, response) in
            // Return data
        }
        
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    func test_get_should_return_data() {
        let expectedData = "{}".data(using: .utf8)
        
        session.nextData = expectedData
        
        var actualData: Data?
        httpClient.get(url: URL(string: "http://mockurl")!) { (data, error) in
            actualData = data
        }
        
        XCTAssertNotNil(actualData)
    }
   
}


