//
//  ResultViewController.swift
//  guessNumberGame
//
//  Created by Yusuf Can Bircan on 26.09.2022.
//

import UIKit

class ResultViewController: UIViewController {

    var message: String?
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "You \(message!)"
    }
    

    

}
