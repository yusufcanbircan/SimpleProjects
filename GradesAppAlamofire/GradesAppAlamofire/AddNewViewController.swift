//
//  AddNewViewController.swift
//  GradesAppAlamofire
//
//  Created by Yusuf Can Bircan on 23.01.2023.
//

import UIKit
import Alamofire

class AddNewViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var grade1TextField: UITextField!
    @IBOutlet var grade2TextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addGradeButton(_ sender: Any) {
        
        if let name = nameTextField.text,
           let not1 = Int(grade1TextField.text!),
           let not2 = Int(grade2TextField.text!){
            addGrade(ders_adi: name, not1: not1, not2: not2)
        }
    }
    
    func addGrade(ders_adi: String, not1: Int, not2: Int) {
        
        let params: Parameters = ["ders_adi": ders_adi, "not1": not1, "not2":not2]
        
        AF.request("http://kasimadalan.pe.hu/notlar/insert_not.php", method: .post, parameters: params).response { response in
            
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
