//
//  MockURLSessionDataTask.swift
//  NewYorkTimesListTests
//
//  Created by Fu-Chiung HSU on 2021/9/19.
//

import Foundation

@testable import NewYorkTimesList

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    
    private(set) var resumeDidCall = false
    
    func resume() {
        
        resumeDidCall = true
    }
}
