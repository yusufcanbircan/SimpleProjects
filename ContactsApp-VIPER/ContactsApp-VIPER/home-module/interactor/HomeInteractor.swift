//
//  HomeInteractor.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import Foundation
import Alamofire

class HomeInteractor: PresenterToInteractorHomeProtocol {
    var interactorToPresenter_Object: InteractorToPresenterHomeProtocol?
    
    func fetchAllContacts_Interactor() {
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php", method: .get).response { response in
            
            if let data = response.data {
                do {
                    
                    let json = try JSONDecoder().decode(ContactsReponse.self, from: data)
                    if let contacts = json.kisiler {
                        self.interactorToPresenter_Object?.sendDataToPresenter(contacts: contacts)
                    }
                
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func searchData_Interactor(searchText: String) {
        let params: Parameters = ["kisi_ad": searchText]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php", method: .post, parameters: params).response { response in
            
            if let data = response.data {
                do {
                    
                    let json = try JSONDecoder().decode(ContactsReponse.self, from: data)
                    if let contacts = json.kisiler {
                        self.interactorToPresenter_Object?.sendDataToPresenter(contacts: contacts)
                    }
                
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func deleteContact_Interactor(contact_id: String) {
        let params: Parameters = ["kisi_id": Int(contact_id)!]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php", method: .post, parameters: params).response { response in
            
            if let data = response.data {
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data)
                    print(json)
                    self.fetchAllContacts_Interactor()
                
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}
