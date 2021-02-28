//
//  Book.swift
//  LayoutPractice
//
//  Created by 정지현 on 2021/02/28.
//

import Foundation

// MARK: - Book
struct BookSearchResponse: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Book]
}

// MARK: - Item
struct Book: Codable {
    let title: String
    let link: String
    let image: String
    let author, price, discount, publisher: String
    let pubdate, isbn, description: String
}
