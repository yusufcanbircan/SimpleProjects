//
//  ResultViewController.swift
//  DictionaryApp
//
//  Created by Yusuf Can Bircan on 10.01.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var turkishLabel: UILabel!
    
    var word: Word?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let word {
            englishLabel.text = word.ingilizce
            turkishLabel.text = word.turkce
        }
    }
    

    

}
