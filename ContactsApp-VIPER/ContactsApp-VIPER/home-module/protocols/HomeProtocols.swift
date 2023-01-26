//
//  HomeProtocols.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import Foundation

protocol ViewToPresenterHomeProtocol {
    var presenterToInteractor_Object: PresenterToInteractorHomeProtocol? { get set }
    var presenterToView_Object: PresenterToViewHomeProtocol? { get set }
    
    func fetchAllContacts_Presenter()
    func searchData_Presenter(searchText: String)
    func deleteContact_Presenter(contact_id: String)
}

protocol PresenterToInteractorHomeProtocol {
    var interactorToPresenter_Object: InteractorToPresenterHomeProtocol? { get set }
    
    func fetchAllContacts_Interactor()
    func searchData_Interactor(searchText: String)
    func deleteContact_Interactor(contact_id: String)
}

protocol InteractorToPresenterHomeProtocol {
    func sendDataToPresenter(contacts: Array<Contacts>)
}

protocol PresenterToViewHomeProtocol {
    func sendDataToView(contacts: Array<Contacts>)
}

protocol PresenterToRouterHomeProtocol {
    static func createModule(ref: HomeViewController)
}
