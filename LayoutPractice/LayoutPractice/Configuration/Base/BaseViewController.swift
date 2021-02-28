//
//  BaseViewController.swift
//  LayoutPractice
//
//  Created by 정지현 on 2021/02/27.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Bar
        self.navigationController?.navigationBar.titleTextAttributes = [
            .font : UIFont.NotoSans(.medium, size: 16),
        ]
        
        // Background Color
        self.view.backgroundColor = .white
    }
    
    // 기타 함수들, 변수들 생성하여 사용하기
    
}
