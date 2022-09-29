//
//  GuessViewController.swift
//  guessNumberGame
//
//  Created by Yusuf Can Bircan on 26.09.2022.
//

import UIKit

class GuessViewController: UIViewController {

    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var remainLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    
    var count:Int = 5
    var randomNumber:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomNumber = Int.random(in: 1...10)
        print(randomNumber!)

        remainLabel.text = "remain time : \(count)"
    }
    
    @IBAction func guessButton(_ sender: Any) {
        
        if count <= 0 {
            let message = "Lost"
            
            performSegue(withIdentifier: "showResult", sender: message)
        } else {
            guessLabel.text = "girdi"
            if let temp = Int(guessTextField.text!) {
                if temp == randomNumber! {
                    let message = "Won"
                    performSegue(withIdentifier: "showResult", sender: message)
                    
                } else {
                    guessLabel.text = "Your Guess : \(guessTextField.text!)"
                    count -= 1
                    remainLabel.text = "remain time : \(count)"
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            if let text = sender as? String {
                let vc = segue.destination as! ResultViewController
                vc.message = text
            }
        }
    }
    

}
