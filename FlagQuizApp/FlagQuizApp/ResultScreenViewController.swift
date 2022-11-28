//
//  ResultScreenViewController.swift
//  FlagQuizApp
//
//  Created by Yusuf Can Bircan on 23.11.2022.
//

import UIKit

class ResultScreenViewController: UIViewController {
    
    @IBOutlet weak var trueFalseLabel: UILabel!
    @IBOutlet weak var correctnessLabel: UILabel!
    
    var trueResult: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //// Hiding Back button
        navigationItem.hidesBackButton = true
        
        if let trueResult {
            trueFalseLabel.text = "\(trueResult) TRUE \(5-trueResult) FALSE"
            correctnessLabel.text = "% \(trueResult*100/5) Correctness"
        }
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

}
