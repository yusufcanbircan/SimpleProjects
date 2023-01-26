//
//  DetailRouter.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import Foundation

class DetailRouter: PresenterToRouterDetailProtocol {
    static func createModule(ref: ContactDetailsViewController) {
        ref.detailPresenter_Object = DetailPresenter()
        ref.detailPresenter_Object?.detailInteractor_Object = DetailInteractor()
    }
}
