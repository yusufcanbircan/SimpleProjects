//
//  AddNewViewController.swift
//  GradesApp
//
//  Created by Yusuf Can Bircan on 17.01.2023.
//

import UIKit

class AddNewViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var grade1TextField: UITextField!
    @IBOutlet weak var grade2TextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addGradeButton(_ sender: Any) {
        if let name = nameTextField.text,
           let grade1 = Double(grade1TextField.text!),
           let grade2 = Double(grade2TextField.text!) {
            
            GradesDao().addGrade(name: name, grade1: grade1, grade2: grade2)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
