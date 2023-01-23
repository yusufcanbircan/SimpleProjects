//
//  EditViewController.swift
//  GradesAppAlamofire
//
//  Created by Yusuf Can Bircan on 23.01.2023.
//

import UIKit
import Alamofire

class EditViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var grade1TextField: UITextField!
    @IBOutlet var grade2TextField: UITextField!
    
    var grade: Notlar?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let grade {
            grade1TextField.text = grade.not1
            grade2TextField.text = grade.not2
            nameTextField.text = grade.ders_adi
        }
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        if let name = nameTextField.text,
           let grade,
           let not1 = Int(grade1TextField.text!),
           let not2 = Int(grade2TextField.text!){
            editGrade(not_id: grade.not_id!, ders_adi: name, not1: not1, not2: not2)
        }
    }
    
    func editGrade(not_id:String, ders_adi: String, not1: Int, not2: Int) {
        
        let params: Parameters = ["not_id":not_id, "ders_adi": ders_adi, "not1": not1, "not2":not2]
        
        AF.request("http://kasimadalan.pe.hu/notlar/update_not.php", method: .post, parameters: params).response { response in
            
            if let data = response.data {
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print(json)
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
   
    

}
