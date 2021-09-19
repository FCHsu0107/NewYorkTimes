//
//  HTTPClientTest.swift
//  NewYorkTimesListTests
//
//  Created by Fu-Chiung HSU on 2021/9/19.
//

import XCTest

@testable import NewYorkTimesList

class HTTPClientTest: XCTestCase {
    
    func test_client_request_error() {
        
        let sut = HTTPClient(session: MockURLSession(mockDataTask: MockURLSessionDataTask()))
        
        let wrongRequest = MockHTTPRequest(urlKey: "")
        
        sut.request(wrongRequest) { result in
            
            switch result {
            
            case .failure(let error):
                
                switch error {
                
                case .requestError: XCTAssert(true)
                    
                default: XCTAssert(false)
                }
                
            case .success: XCTAssert(false)
            }
        }
    }
    
    func test_client_response_error() {
        
        let responseError = NSError.init(
            domain: "thecatapi.com",
            code: 404,
            userInfo: [NSLocalizedDescriptionKey: "Response error"]
        )
        
        let session = MockURLSession(mockDataTask: MockURLSessionDataTask(), error: responseError)
        
        let sut = HTTPClient(session: session)
        
        sut.request(MockHTTPRequest()) { result in
            
            switch result {
            
            case .failure(let error):
                
                switch error {
                
                case .responseError(let message): XCTAssertTrue(message == "Response error")
                    
                default: XCTAssert(false)
                }
                
            case .success: XCTAssert(false)
            }
        }
    }
    
    func test_client_no_data_error() {
        
        let sut = HTTPClient(session: MockURLSession(mockDataTask: MockURLSessionDataTask()))
        
        sut.request(MockHTTPRequest()) { result in
            
            switch result {
            
            case .failure(let error):
                
                switch error {
                
                case .responseError(let message): XCTAssertTrue(message == "No data")
                    
                default: XCTAssert(false)
                }
                
            case .success: XCTAssert(false)
            }
        }
    }
    
    func test_client_unexpected_error() {
        
        let session = MockURLSession(mockDataTask: MockURLSessionDataTask(), fakeData: Data(), statusCode: 100)
        
        let sut = HTTPClient(session: session)
        
        sut.request(MockHTTPRequest()) { result in
            
            switch result {
            
            case .failure(let error):
                
                switch error {
                
                case .unexpectedError: XCTAssert(true)
                    
                default: XCTAssert(false)
                }
                
            case .success: XCTAssert(false)
            }
        }
    }
    
    func test_client_reponse_success() {
        
        let session = MockURLSession(mockDataTask: MockURLSessionDataTask(), fakeData: Data(), statusCode: 200)
        
        let sut = HTTPClient(session: session)
        
        sut.request(MockHTTPRequest()) { result in
            
            switch result {
            
            case .failure: XCTAssert(false)
                
            case .success: XCTAssert(true)
            }
        }
    }
}
