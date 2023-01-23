//
//  ResultViewController.swift
//  DictionaryAppURLSession
//
//  Created by Yusuf Can Bircan on 23.01.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var englishLabel: UILabel!
    @IBOutlet var turkishLabel: UILabel!
    
    var words: Kelimeler?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let words {
            englishLabel.text = words.ingilizce
            turkishLabel.text = words.turkce
        }
        
    }
    
}
