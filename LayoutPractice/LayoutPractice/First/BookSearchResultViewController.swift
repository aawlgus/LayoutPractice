//
//  BookSearchResultViewController.swift
//  LayoutPractice
//
//  Created by 정지현 on 2021/02/28.
//

import UIKit

class BookSearchResultViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var queryTextField: UITextField!
    
    let dataManager = BookSearchDataManager()
    let query: String
    //var books: [Book] = []
    var bookData: [BookData] = []
    
    let bookCell = BookTableViewCell()
    
    init(_ query: String) {
        self.query = query
        super.init(nibName: "BookSearchResultViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "책 추가"
        
        self.showIndicator()
        dataManager.searchBook(query: query, viewController: self)
        
        self.dismissKeyboardWhenTappedAround()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: bookCell.cellID)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
}

extension BookSearchResultViewController {
    func didRetrieveBookData() {
        self.dismissIndicator()
        //self.books = items
        self.tableView.reloadData()
    }
    func failedToRequest(message: String) {
        self.dismissIndicator()
        self.presentAlert(title: message)
    }
}

extension BookSearchResultViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: bookCell.cellID) as! BookTableViewCell
        let book = bookData[indexPath.row]
        if book.title == "" {
            cell.titleLabel.text = "정보 없음"
        } else {
            cell.titleLabel.text = book.title
        }
        if book.author == "" {
            cell.authorLabel.text = "정보 없음"
        } else {
            cell.authorLabel.text = book.author
        }
        if book.publisher == "" {
            cell.publisherLabel.text = "정보 없음"
        } else {
            cell.publisherLabel.text = book.publisher
        }
        if let thumbnailImage = book.imageData {
            cell.bookImage.image = thumbnailImage
        } else {
            DispatchQueue.global().async {
                book.getPosterImage()
                guard let thumbnail = book.imageData else {
                    DispatchQueue.main.async {
                        cell.bookImage.image = UIImage(named: "img_placeholder")
                    }
                    return
                }
                DispatchQueue.main.async {
                    cell.bookImage.image = thumbnail
                }
            }
        }
        cell.bookImage.image = book.imageData
        
        return cell
    }
    
    
}
