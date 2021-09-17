//
//  Book.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/14.
//

import Foundation

extension APIModel {
    
    struct Books: Codable {
        
        let status, copyright: String
        let numResults: Int
        let results: [Book]

        enum CodingKeys: String, CodingKey {
            
            case status, copyright
            case numResults = "num_results"
            case results
        }
    }

    struct Book: Codable {
        
        let title: String
        let resultDescription: String?
        let contributor: String?
        let author: String
        let contributorNote: String?
        let price: String
        let ageGroup, publisher: String?
        let isbns: [Isbn]
        let ranksHistory: [RanksHistory]
        let reviews: [BookReview]

        enum CodingKeys: String, CodingKey {
            
            case title
            case resultDescription = "description"
            case contributor, author
            case contributorNote = "contributor_note"
            case price
            case ageGroup = "age_group"
            case publisher, isbns
            case ranksHistory = "ranks_history"
            case reviews
        }
    }

    struct Isbn: Codable {
        
        let isbn10: String
        let isbn13: String
    }

    struct RanksHistory: Codable {
        
        let primaryIsbn10, primaryIsbn13: String
        let rank: Int
        let listName, displayName, publishedDate, bestsellersDate: String
        let weeksOnList, rankLastWeek, asterisk, dagger: Int

        enum CodingKeys: String, CodingKey {
            
            case primaryIsbn10 = "primary_isbn10"
            case primaryIsbn13 = "primary_isbn13"
            case rank
            case listName = "list_name"
            case displayName = "display_name"
            case publishedDate = "published_date"
            case bestsellersDate = "bestsellers_date"
            case weeksOnList = "weeks_on_list"
            case rankLastWeek = "rank_last_week"
            case asterisk, dagger
        }
    }

    struct BookReview: Codable {
        
        let bookReviewLink: String
        let firstChapterLink: String?
        let sundayReviewLink: String
        let articleChapterLink: String?

        enum CodingKeys: String, CodingKey {
            
            case bookReviewLink = "book_review_link"
            case firstChapterLink = "first_chapter_link"
            case sundayReviewLink = "sunday_review_link"
            case articleChapterLink = "article_chapter_link"
        }
    }

}
