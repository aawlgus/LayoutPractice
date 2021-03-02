//
//  Book.swift
//  LayoutPractice
//
//  Created by 정지현 on 2021/02/28.
//

import UIKit

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

class BookData {
    var title: String?
    var image: String?
    var imageData: UIImage?
    var author, price, discount, publisher: String?
    var pubdate, isbn, description: String?
    
    func getPosterImage() {
        guard image != nil else {
            return
        }
        if let url = URL(string: image!) {
            if let imgData = try? Data(contentsOf: url) {
                if let image = UIImage(data: imgData) {
                    self.imageData = image
                }
            }
        }
        
        return
    }
}

