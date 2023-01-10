//
//  WordDao.swift
//  DictionaryApp
//
//  Created by Yusuf Can Bircan on 28.11.2022.
//

import Foundation

class WordDao {
    var db: FMDatabase?
    
    init() {
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let databaseURL = URL(fileURLWithPath: destinationPath).appending(path: "sozluk.sqlite")
        
        db = FMDatabase(path: databaseURL.path())
    }
}
