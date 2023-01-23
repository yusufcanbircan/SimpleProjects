//
//  GradesTableViewCell.swift
//  GradesAppAlamofire
//
//  Created by Yusuf Can Bircan on 23.01.2023.
//

import UIKit

class GradesTableViewCell: UITableViewCell {

    
    @IBOutlet var courseName: UILabel!
    @IBOutlet var grade1: UILabel!
    @IBOutlet var grade2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
