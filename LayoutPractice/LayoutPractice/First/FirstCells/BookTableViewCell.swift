//
//  BookTableViewCell.swift
//  LayoutPractice
//
//  Created by 정지현 on 2021/02/28.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    let cellID = "BookTableViewCell"
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bookImage.image = UIImage(named: "animal_farm")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
