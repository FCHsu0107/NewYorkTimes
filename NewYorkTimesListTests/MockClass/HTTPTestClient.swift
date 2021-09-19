//
//  HTTPTestClient.swift
//  NewYorkTimesListTests
//
//  Created by Fu-Chiung HSU on 2021/9/19.
//

import Foundation
@testable import NewYorkTimesList

class HTTPTestClient {

    func books() -> HTTPClientProtocol {
        
        guard let path = Bundle(for: type(of: self)).path(forResource: "Books", ofType: "json") else {
            fatalError("Books.json not found")
        }
        
        let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        
        let session = MockURLSession(mockDataTask: MockURLSessionDataTask(), fakeData: data, error: nil)
        
        let client = HTTPClient(session: session)
        
        return client
    }
}
