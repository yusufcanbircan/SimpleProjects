//
//  ViewController.swift
//  FlagQuizApp
//
//  Created by Yusuf Can Bircan on 23.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //// Copying The Database
        copyDatabase()
    }
    
    func copyDatabase() {
        
        let bundlePath = Bundle.main.path(forResource: "bayrakquiz", ofType: ".sqlite")
        
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let copyDestination = URL(fileURLWithPath: destinationPath).appending(path: "bayrakquiz.sqlite")
        
        if !FileManager.default.fileExists(atPath: copyDestination.path()){
            
            do {
                
                try FileManager.default.copyItem(atPath: bundlePath!, toPath: copyDestination.path())
                
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    
}
