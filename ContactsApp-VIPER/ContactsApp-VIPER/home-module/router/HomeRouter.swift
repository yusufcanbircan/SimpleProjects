//
//  HomeRouter.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import Foundation

class HomeRouter: PresenterToRouterHomeProtocol {
    static func createModule(ref: HomeViewController) {
        let presenter = HomePresenter()
        
        ref.viewToPresenter_Object = presenter
        
        ref.viewToPresenter_Object?.presenterToInteractor_Object = HomeInteractor()
        ref.viewToPresenter_Object?.presenterToView_Object = ref
        
        ref.viewToPresenter_Object?.presenterToInteractor_Object?.interactorToPresenter_Object = presenter
    }
}
