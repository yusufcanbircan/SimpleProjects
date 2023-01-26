//
//  DetailPresenter.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import Foundation

class DetailPresenter: ViewToPresenterDetailProtocol {
    var detailInteractor_Object: PresenterToInteractorDetailProtocol?
    
    func update_Presenter(contact_id: String, contact_name: String, contact_phone: String) {
        detailInteractor_Object?.update_Interactor(contact_id: contact_id, contact_name: contact_name, contact_phone: contact_phone)
    }
}
