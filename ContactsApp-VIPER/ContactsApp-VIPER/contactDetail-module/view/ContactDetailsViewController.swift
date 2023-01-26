//
//  ContactDetailsViewController.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    
    var detailPresenter_Object: ViewToPresenterDetailProtocol?
    
    var contact: Contacts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contact {
            nameTextField.text = "\(contact.kisi_ad!)"
            phoneNumberTextField.text = "\(contact.kisi_tel!)"
        }
        
        DetailRouter.createModule(ref: self)

    }

    @IBAction func updateContactButton(_ sender: Any) {
        if let name = nameTextField.text,
           let phone =  phoneNumberTextField.text{
            
            if let contact {
                detailPresenter_Object?.update_Presenter(contact_id: contact.kisi_id!,contact_name: name, contact_phone: phone)
            }
        }
    }
    
}
