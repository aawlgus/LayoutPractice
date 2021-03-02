//
//  BookSearchDataManager.swift
//  LayoutPractice
//
//  Created by 정지현 on 2021/02/28.
//

import UIKit
import Alamofire

class BookSearchDataManager {
    func searchBook(query: String, viewController: BookSearchResultViewController) {
        let urlString = "\(Constant.NAVER_BASE_URL)?query=\(query)"
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: encodedString!)
        //let params: Parameters = ["query": query]
        let headers: HTTPHeaders = ["X-Naver-Client-Id": NaverKey.CLIENT_ID, "X-Naver-Client-Secret": NaverKey.CLIENT_SECRET]
        AF.request(url!, method: .get, headers: headers)
            .validate()
            .responseDecodable(of: BookSearchResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    if response.total == 0 {
                        viewController.failedToRequest(message: "검색 결과가 없습니다. ")
                    } else {
                        //viewController.didRetrieveBookData(response.items)
                        for i in 1...response.items.count {
                            let book = BookData()
                            let bookResponse = response.items[i-1]
                            book.title = bookResponse.title
                            book.author = bookResponse.author
                            book.publisher = bookResponse.publisher
                            book.image = bookResponse.image
                            DispatchQueue.global().async {
                                guard book.image != nil else {
                                    return
                                }
                                if let url = URL(string: book.image!) {
                                    if let imageData = try? Data(contentsOf: url) {
                                        book.imageData = UIImage(data: imageData)
                                    }
                                }
                                viewController.bookData.append(book)
                                DispatchQueue.main.async {
                                    viewController.didRetrieveBookData()
                                }
                            }
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다. ")
                }
            }
    }
}
