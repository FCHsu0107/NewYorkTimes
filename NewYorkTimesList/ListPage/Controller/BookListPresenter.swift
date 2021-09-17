//
//  BookListPresenter.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/16.
//

import Foundation

class BookItem {
    
    var title: String

    var author: String
    
    var price: String
    
    var description: String
    
    var showPartDescription: Bool { description.count > 50 }
    
    var previusPartOfDescription: String? { description.prefix(50).appending(" ...") }
    
    let action: (() -> Void)?

    fileprivate init(book: APIModel.Book, action: (() -> Void)? = nil) {
        
        self.title = book.title
        
        self.author = book.author
        
        self.description = book.resultDescription ?? ""
        
        self.price = (book.price == "0.00") ? "Free" : book.price
        
        self.action = action
    }
}

struct BookResult {
    
    var hasBooks: Bool { !bookItems.isEmpty }
    
    let endOfList: Bool
    
    let bookItems: [BookItem]
    
    let errorMessage: String?
    
    init(bookItems: [BookItem], endOfList: Bool = false, message: String? = nil) {
        
        self.bookItems = bookItems
    
        self.endOfList = endOfList
        
        self.errorMessage = message
    }
    
    static func errorResult(message: String) -> BookResult {
        BookResult(bookItems: [], endOfList: true, message: message)
    }
}

class BookListPresenter {
    
    private var initalItems = [BookItem]()
    
    private var initalBookDidComplete = false
    
    private let provider: BookProviderProtocol
    
    private var page: Int = 0
    
    private var maxPage: Int = 0

//    deinit { print("\(className) deinit") }
    
    init(provider: BookProviderProtocol = BookProvider()) {
        
        self.provider = provider
    }

//    func numberOfItems() -> Int {
//
//        return items.count
//    }
//
//    func bookItem(at row: Int) -> BookItem {
//
//        assert(row >= 0 && row < items.count)
//
//        return items[row]
//    }
}

extension BookListPresenter {

    
    func fetchNextBooks(completion: @escaping (BookResult) -> Void) {
        
        provider.getList(page: page) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            
            case .failure(let error):
                
                completion(BookResult.errorResult(message: error.message))
                
            case .success(let books):
                
                if self.page == 0 {

                    self.updateMaxPage(books.numResults)
                }
                
                let newItems = self.makeItems(books: books.results)
                
                self.updatePage(self.page)
                
                let endOfList = self.page == self.maxPage
                
                completion(BookResult(bookItems: newItems, endOfList: endOfList))
            }
        }
    }
    
    private func makeItems(books: [APIModel.Book]) -> [BookItem] {
        
        books.map({ BookItem(book: $0) })
    }
    
    private func updateMaxPage(_ num: Int) {
        
        maxPage = num / 20
    }
    
    private func updatePage(_ currentPage: Int) {
        
        page = currentPage + 1
    }
}
