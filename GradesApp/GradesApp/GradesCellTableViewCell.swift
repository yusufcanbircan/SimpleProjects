//
//  GradesCellTableViewCell.swift
//  GradesApp
//
//  Created by Yusuf Can Bircan on 17.01.2023.
//

import UIKit

class GradesCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gradeName: UILabel!
    @IBOutlet weak var grade1: UILabel!
    @IBOutlet weak var grade2: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
