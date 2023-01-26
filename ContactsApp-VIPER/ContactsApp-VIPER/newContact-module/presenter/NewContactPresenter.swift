//
//  NewContactPresenter.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import Foundation

class NewContactPresenter: ViewToPresenterNewContactProtocol {
    var newContactInteractor_Object: PresenterToInteractorNewContactProtocol?
    
    func addContact_Presenter(contact_name: String, contact_phone: String) {
        newContactInteractor_Object?.addContact_Interactor(contact_name: contact_name, contact_phone: contact_phone)
    }
    
}
