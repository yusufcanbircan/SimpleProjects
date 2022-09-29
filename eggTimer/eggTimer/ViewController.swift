//
//  ViewController.swift
//  eggTimer
//
//  Created by Yusuf Can Bircan on 28.09.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationAppearance()
        
    }
    
    
    @IBAction func button1Tapped(_ sender: Any) {
        let image = "1"
        performSegue(withIdentifier: "timerSegue", sender: image)
    }
    
    @IBAction func button2Tapped(_ sender: Any) {
        let image = "2"
        performSegue(withIdentifier: "timerSegue", sender: image)
    }
    
    @IBAction func button3Tapped(_ sender: Any) {
        let image = "3"
        performSegue(withIdentifier: "timerSegue", sender: image)
    }
    
    @IBAction func button4Tapped(_ sender: Any) {
        let image = "4"
        performSegue(withIdentifier: "timerSegue", sender: image)
    }
    
    func navigationAppearance(){
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = .systemGray4
        
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactScrollEdgeAppearance = appearance
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "timerSegue" {
            if let image = sender as? String {
                let vc = segue.destination as? TimerViewController
                vc?.image = image
            }
        }
    }


}

