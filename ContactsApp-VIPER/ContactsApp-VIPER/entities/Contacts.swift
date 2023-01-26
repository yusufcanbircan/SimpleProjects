//
//  Contacts.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import Foundation

class Contacts: Codable {
    
    var kisi_id: String?
    var kisi_ad: String?
    var kisi_tel: String?
    
    init() {
        
    }
    
    init(kisi_id: String, kisi_ad: String, kisi_tel: String) {
        self.kisi_id = kisi_id
        self.kisi_ad = kisi_ad
        self.kisi_tel = kisi_tel
    }
}
