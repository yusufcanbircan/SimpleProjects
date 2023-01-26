//
//  NewContactRouter.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import Foundation

class NewContactRouter: PresenterToRouterNewContactProtocol {
    static func createModule(ref: NewContactViewController) {
        ref.newContactPresenter_Object = NewContactPresenter()
        ref.newContactPresenter_Object?.newContactInteractor_Object = NewContactInteractor()
    }
}
