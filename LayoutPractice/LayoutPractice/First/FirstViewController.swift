//
//  FirstViewController.swift
//  LayoutPractice
//
//  Created by 정지현 on 2021/02/27.
//

import UIKit

class FirstViewController: BaseViewController {
    
    @IBOutlet weak var queryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "네이버 책 검색"
        
        self.dismissKeyboardWhenTappedAround()
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        guard let query = queryTextField.text?.trim, query.isExists else {
            self.presentAlert(title: "검색어를 입력하세요. ")
            return
        }
        let resultVC = BookSearchResultViewController(query)
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
    

}
