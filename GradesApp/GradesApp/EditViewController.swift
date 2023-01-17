//
//  EditViewController.swift
//  GradesApp
//
//  Created by Yusuf Can Bircan on 17.01.2023.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var grade1TextField: UITextField!
    @IBOutlet weak var grade2TextField: UITextField!
    
    var grade: Grades?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let grade {
            nameTextField.text = grade.name
            grade1TextField.text = "\(grade.grade1!)"
            grade2TextField.text = "\(grade.grade2!)"
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let grade,
            let name = nameTextField.text,
           let grade1 = Double(grade1TextField.text!),
           let grade2 = Double(grade2TextField.text!) {
            
            GradesDao().updateData(id: grade.id!, name: name, grade1: grade1, grade2: grade2)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
