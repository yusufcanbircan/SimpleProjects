//
//  NewContactProtocols.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import Foundation

protocol PresenterToInteractorNewContactProtocol {
    func addContact_Interactor(contact_name: String, contact_phone: String)
}

protocol ViewToPresenterNewContactProtocol {
    var newContactInteractor_Object: PresenterToInteractorNewContactProtocol? { get set }
    
    func addContact_Presenter(contact_name: String, contact_phone: String)
}

protocol PresenterToRouterNewContactProtocol {
    static func createModule(ref: NewContactViewController)
}
