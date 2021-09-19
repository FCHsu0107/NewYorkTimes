//
//  BookProvider.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/14.
//

import Foundation

protocol BookProviderProtocol {
    
    func getList(page: Int, completion: @escaping (Result<APIModel.Books, HTTPClientError>) -> Void)
}

class BookProvider: BookProviderProtocol {
    
    private let client: HTTPClientProtocol
    
    init(client: HTTPClientProtocol = HTTPClient.shared) {
        
        self.client = client
    }
    
    func getList(page: Int = 0, completion: @escaping (Result<APIModel.Books, HTTPClientError>) -> Void) {
        
        client.request(BookRequest.bestSellers(page: page)) { result in
            
            switch result {
            
            case .success(let data):
                do {
                    
                    let books = try JSONDecoder().decode(APIModel.Books.self, from: data)
                    
                    completion(.success(books))
                    
                } catch {
                 
                    completion(.failure(.decodeError))
                }
                
            case .failure(let error):
                
                completion(.failure(error))
                
            }
        }
    }
}
