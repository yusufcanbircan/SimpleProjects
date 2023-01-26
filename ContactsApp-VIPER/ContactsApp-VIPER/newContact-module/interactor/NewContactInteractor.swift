//
//  NewContactInteractor.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import Foundation
import Alamofire

class NewContactInteractor: PresenterToInteractorNewContactProtocol {
    func addContact_Interactor(contact_name: String, contact_phone: String) {
        let params: Parameters = ["kisi_ad": contact_name, "kisi_tel": contact_phone]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php", method: .post, parameters: params).response { response in
            
            if let data = response.data {
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data)
                    print(json)
                
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}
