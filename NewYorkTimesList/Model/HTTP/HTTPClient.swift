//
//  HTTPClient.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/14.
//

import Foundation

enum HTTPClientError: Error {
    
    case requestError
    
    case decodeError
    
    case clientError(Data)
    
    case serverError(message: String)
    
    case unexpectedError
}

enum HTTPMethod: String {
    
    case GET
    
    case POST
    
    case DELETE
    
    case PUT
}

protocol HTTPRequest {
    
    var baseUrlKey: String { get }
    
    var method: String { get }
    
    var path: String { get }
    
    var headers: [String: String] { get }
    
    var body: [String: Any]? { get }
    
    var params: [String: String]? { get }
}

class HTTPClient {
    
    static let shared = HTTPClient()
    
    private let decoder = JSONDecoder()
    
    private let encoder = JSONEncoder()
    
    private init() { }
    
    func request(_ hpptRequest: HTTPRequest, completion: @escaping (Result<Data, HTTPClientError>) -> Void) {
        
        guard let request = makeRequest(hpptRequest) else { return completion(Result.failure(HTTPClientError.requestError)) }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                
                return completion(Result.failure(HTTPClientError.serverError(message: error.localizedDescription)))
            }
            
            guard let data = data, let response = response as? HTTPURLResponse else {
                
                return completion(Result.failure(HTTPClientError.serverError(message: "Can't get correct data or response")))
            }
            
            let statusCode = response.statusCode
            
            switch statusCode {
            
            case 200..<300:
                
                completion(Result.success(data))
            
            case 400..<500:

                completion(Result.failure(HTTPClientError.clientError(data)))
                
            case 500..<600:
                
                completion(Result.failure(HTTPClientError.serverError(message: "Server status code is between 400 and 500")))
            
            default:
            
                completion(Result.failure(HTTPClientError.unexpectedError))
            }
            
        }.resume()
    }
    
    
    private func makeRequest(_ hpptRequest: HTTPRequest) -> URLRequest? {
        
        guard let baseUrlString = Bundle.valueForString(hpptRequest.baseUrlKey),
              let path = hpptRequest.path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return nil
        }
        
        let urlString = baseUrlString + path
        
        guard var components = URLComponents(string: urlString) else { return nil }
        
        if let params = hpptRequest.params {
            
            components.queryItems = params.map({ key, value in
                
                URLQueryItem(name: key, value: value)
            })
        }
        
        guard let url = components.url else { return nil }
        
        var request = URLRequest(url: url)
        
        request.allHTTPHeaderFields = hpptRequest.headers
        
        if let body = hpptRequest.body {
            
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        }
        
        return request
    }
    
}
