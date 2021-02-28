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
    var books: [Book] = []
    
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
    }
}

extension BookSearchResultViewController {
    func didRetrieveBookData(_ items: [Book]) {
        self.dismissIndicator()
        self.books = items
        self.tableView.reloadData()
    }
    func failedToRequest(message: String) {
        self.dismissIndicator()
        self.presentAlert(title: message)
    }
}

extension BookSearchResultViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let book = books[indexPath.row]
        cell.textLabel?.text = book.title
        return cell
    }
    
    
}
