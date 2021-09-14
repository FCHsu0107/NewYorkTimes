//
//  BookRequest.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/14.
//

import Foundation

enum BookRequest: HTTPRequest {
    
    case bestSellers(page: Int)
    
    var baseUrlKey: String {
        
        APIContent.baseUrlKey
    }
    
    var method: String {
        
        switch self {
        
        case .bestSellers: return HTTPMethod.GET.rawValue
        }
    }
    
    var path: String {
        
        switch self {
        
        case .bestSellers: return "/lists/best-sellers/history.json"
        }
    }
    
    var headers: [String : String] {
        
        [ : ]
    }
    
    var body: [String : Any]? {
    
        nil
    }
    
    var params: [String : String]? {
        
        guard let key = Bundle.apiKey(.client) else { return nil }
        
        switch self {
        
        case .bestSellers(let page):
            return [
                "api-key" : key,
                "offset" : getoffset(page)
            ]
        }
    }
    
    private func getoffset(_ page: Int) -> String {
        
        return String(page * 20)
    }
    
}
