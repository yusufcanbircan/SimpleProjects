//
//  NewContactViewController.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import UIKit

class NewContactViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    
    var newContactPresenter_Object: ViewToPresenterNewContactProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewContactRouter.createModule(ref: self)

    }
    
    @IBAction func addNewContactButton(_ sender: Any) {
        
        if let name = nameTextField.text,
           let phone = phoneNumberTextField.text {
            newContactPresenter_Object?.addContact_Presenter(contact_name: name, contact_phone: phone)
        }
        
    }
    
}
