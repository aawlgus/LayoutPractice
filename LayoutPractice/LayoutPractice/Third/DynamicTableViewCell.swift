//
//  DynamicTableViewCell.swift
//  LayoutPractice
//
//  Created by 정지현 on 2021/03/01.
//

import UIKit

class DynamicTableViewCell: UITableViewCell {
    
    let cellID = "DynamicTableViewCell"

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = profileImage.frame.width / 2 // 원형으로 만들기
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
