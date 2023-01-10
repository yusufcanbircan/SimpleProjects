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
    
    func fetchAllData() -> [Word] {
        var words = [Word]()
        
        db?.open()
        
        do {
            
            let rs = try db!.executeQuery("SELECT * FROM kelimeler", values: nil)
            
            while rs.next() {
                let word = Word(kelime_id: Int(rs.string(forColumn: "kelime_id"))!,
                                ingilizce: rs.string(forColumn: "ingilizce")!,
                                turkce: rs.string(forColumn: "turkce")!)
                
                words.append(word)
            }
            
        } catch {
            
            print(error.localizedDescription)
            
        }
        
        db?.close()
        
        return words
    }
    
    func searchInData(searchText: String) -> [Word] {
        var words = [Word]()
        
        db?.open()
        
        do {
            
            let rs = try db!.executeQuery("SELECT * FROM kelimeler WHERE ingilizce LIKE '\(searchText)%'", values: nil)
            
            while rs.next() {
                let word = Word(kelime_id: Int(rs.string(forColumn: "kelime_id"))!,
                                ingilizce: rs.string(forColumn: "ingilizce")!,
                                turkce: rs.string(forColumn: "turkce")!)
                words.append(word)
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return words
    }
}
