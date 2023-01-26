//
//  ContactTableViewCell.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet var contactInformationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
