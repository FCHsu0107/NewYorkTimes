//
//  MockHTTPRequest.swift
//  NewYorkTimesListTests
//
//  Created by Fu-Chiung HSU on 2021/9/19.
//

import Foundation
@testable import NewYorkTimesList

class MockHTTPRequest: HTTPRequest {
    
    var baseUrlKey: String
    
    var method: String
    
    var path: String = ""
    
    var headers: [String : String] = [:]
    
    var body: [String : Any]?
    
    var params: [String : String]?
    
    init(urlKey: String = APIContent.baseUrlKey, method: HTTPMethod = .GET) {
        
        self.baseUrlKey = urlKey
        
        self.method = method.rawValue
    }
}
