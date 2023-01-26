//
//  DetailProtocols.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import Foundation

protocol ViewToPresenterDetailProtocol {
    var detailInteractor_Object: PresenterToInteractorDetailProtocol? { get set }
    
    func update_Presenter(contact_id: String, contact_name: String, contact_phone: String)
}

protocol PresenterToInteractorDetailProtocol {
    func update_Interactor(contact_id: String, contact_name: String, contact_phone: String)
}

protocol PresenterToRouterDetailProtocol {
    static func createModule(ref: ContactDetailsViewController)
}

