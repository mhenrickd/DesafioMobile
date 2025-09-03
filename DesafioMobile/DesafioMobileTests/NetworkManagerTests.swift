//
//  NetworkManagerTests.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 02/09/25.
//

import XCTest
import Alamofire
import Swifter
@testable import DesafioMobile

class NetworkManagerTests: XCTestCase {
    
    private var server: HttpServer = HttpServer()
    var networkManager: NetworkManagerRepository!
    
    override func setUp() {
        super.setUp()
        setupServer()
        networkManager = NetworkManagerRepository.shared
    }
    
    override func tearDown() {
        super.tearDown()
        networkManager = nil
        server.stop()
    }
    
    func testFetchFeedNewsSuccess() {
        let expectation = self.expectation(description: "Fetch success")
        
        setupSuccess()
        networkManager.endpoint = URL(string: "http://localhost:8080/newsFeed")!
        networkManager.fetchFeedNews { result, articles in
            XCTAssertTrue(result)
            XCTAssertNotNil(articles)
            XCTAssertEqual(articles?.count, 50)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("Expectation failed with error: \(error)")
            }
        }
    }
    
    func testFetchFeedNewsFailure() {
        let expectation = self.expectation(description: "Fetch failure")
        
        setupFailure()
        networkManager.endpoint = URL(string: "http://localhost:8080/error")!
        networkManager.fetchFeedNews { result, articles in
            XCTAssertTrue(result)
            XCTAssertNil(articles)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("Expectation failed with error: \(error)")
            }
        }
    }
}

extension NetworkManagerTests {
    private func setupServer() {
        do {
            try server.start(in_port_t(8080))
        } catch {
            print(error)
        }
    }
    
    private func setupSuccess() {
        server.GET["/newsFeed"] = { request in
            self.setupResponse(responseUrl: "news_response")
        }
    }
    
    private func setupFailure() {
        server.GET["/error"] = { request in
            self.setupResponse(responseUrl: "error_response")
        }
    }
    
    private func setupResponse(responseUrl: String) -> HttpResponse{
        let bundle = Bundle(for: NetworkManagerTests.self)
        guard let url = bundle.url(forResource: responseUrl, withExtension: "json") else {
            XCTFail("Json not found")
            return HttpResponse.notFound
        }
        guard let data = try? Data(contentsOf: url) else {
            XCTFail("Parse error")
            return HttpResponse.notFound
        }
        guard let serialization = try? JSONSerialization.jsonObject(with: data, options: []) else {
            XCTFail("Parse error")
            return HttpResponse.notFound
        }
        return HttpResponse.ok(.json(serialization))
    }
}
