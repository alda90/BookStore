//
//  Response.swift
//  BookStore
//
//  Created by AlDAIR cARRILO  on 13/09/21.
//  Copyright © 2021 CGTI. All rights reserved.
//

import Foundation

// MARK: - Response
struct Response: Codable {
    let results: Results?
}

// MARK: - Results
struct Results: Codable {
    let books: [Book]
}

// MARK: - Book
struct Book: Codable {
    let isbn, title, author, bookDescription: String?
    let genre: String
    let img: String?
    let imported: Bool

    enum CodingKeys: String, CodingKey {
        case isbn, title, author
        case bookDescription = "description"
        case genre, img, imported
    }
}
