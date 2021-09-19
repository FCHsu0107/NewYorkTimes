//
//  BreedProviderTest.swift
//  NewYorkTimesListTests
//
//  Created by Fu-Chiung HSU on 2021/9/19.
//

import XCTest
@testable import NewYorkTimesList

class BookProviderTest: XCTestCase {
    
    private lazy var client = HTTPTestClient()
    
    func test_decode_books_success() {
        
        let numResults: Int = 33905
        let currentResultCount: Int = 20
        let firstBookTitle: String = "\"I GIVE YOU MY BODY ...\""
        let firstBookAuthor: String = "Diana Gabaldon"
        let firstBookPrice: String = "0.00"
        
        let sut = BookProvider(client: client.books())
        
        sut.getList { result in
            
            switch result {
            
            case .failure: XCTAssert(false)
                
            case .success(let books):
                
                XCTAssertEqual(books.numResults, numResults)
                XCTAssertEqual(books.results.count, currentResultCount)
                
                let firstBook = books.results[0]
                XCTAssertEqual(firstBook.title, firstBookTitle)
                XCTAssertEqual(firstBook.author, firstBookAuthor)
                XCTAssertEqual(firstBook.price, firstBookPrice)
            }
            
        }
    }
}
