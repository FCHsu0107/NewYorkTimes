//
//  MockURLSession.swift
//  NewYorkTimesListTests
//
//  Created by Fu-Chiung HSU on 2021/9/19.
//

import Foundation
@testable import NewYorkTimesList

class MockURLSession: URLSessionProtocol {
    
    private let mockDataTask: MockURLSessionDataTask
    private let fakeData: Data?
    private let error: Error?
    private let statusCode: Int
    
    init(mockDataTask: MockURLSessionDataTask,
         fakeData: Data? = nil,
         error: Error? = nil,
         statusCode: Int = 200) {
        
        self.mockDataTask = mockDataTask
        self.fakeData = fakeData
        self.error = error
        self.statusCode = statusCode
    }
    
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        
        if let _error = self.error {
            
            completionHandler(nil, nil, _error)
            
            return self.mockDataTask
        }
        
        if let _data = self.fakeData {
            
            let response = self.mockHttpURLResponse(request: request)
            
            completionHandler(_data, response, nil)
            
            return self.mockDataTask
        }
        
        let response = self.mockHttpURLResponse(request: request)
        
        completionHandler(nil, response, nil)
        
        return self.mockDataTask
    }
}

// MARK: Private
extension MockURLSession {
    
    private func mockHttpURLResponse(request: URLRequest) -> URLResponse {
        
        return HTTPURLResponse(url: request.url!,
                               statusCode: self.statusCode,
                               httpVersion: "HTTP/1.0",
                               headerFields: nil)!
    }
}
