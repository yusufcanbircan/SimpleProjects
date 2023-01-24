//
//  CategoryTableViewCell.swift
//  MoviesAppWithFirebase
//
//  Created by Yusuf Can Bircan on 24.01.2023.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
