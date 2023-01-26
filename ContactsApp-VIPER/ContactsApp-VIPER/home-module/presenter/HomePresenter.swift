//
//  HomePresenter.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import Foundation

class HomePresenter: ViewToPresenterHomeProtocol {
    var presenterToInteractor_Object: PresenterToInteractorHomeProtocol?
    
    var presenterToView_Object: PresenterToViewHomeProtocol?
    
    func fetchAllContacts_Presenter() {
        presenterToInteractor_Object?.fetchAllContacts_Interactor()
    }
    
    func searchData_Presenter(searchText: String) {
        presenterToInteractor_Object?.searchData_Interactor(searchText: searchText)
    }
    
    func deleteContact_Presenter(contact_id: String) {
        presenterToInteractor_Object?.deleteContact_Interactor(contact_id: contact_id)
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func sendDataToPresenter(contacts: Array<Contacts>) {
        presenterToView_Object?.sendDataToView(contacts: contacts)
    }
}
