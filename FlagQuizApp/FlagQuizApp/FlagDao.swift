//
//  FlagDao.swift
//  FlagQuizApp
//
//  Created by Yusuf Can Bircan on 24.11.2022.
//

import Foundation

class FlagDao {
    var db:FMDatabase?
    
    init() {
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let databaseURL = URL(fileURLWithPath: destinationPath).appending(path: "bayrakquiz.sqlite")
        
        db = FMDatabase(path: databaseURL.path())
    }
    
    func fetch5RandomQuestion() -> [Flag] {
        var flags = [Flag]()
        
        db?.open()
        
        do {
            
            let rs = try db!.executeQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 5", values: nil)
            
            while rs.next() {
                let flag = Flag(bayrak_id: Int(rs.string(forColumn: "bayrak_id"))!,
                                bayrak_ad: rs.string(forColumn: "bayrak_ad")!,
                                bayrak_resim: rs.string(forColumn: "bayrak_resim")!)
                
                flags.append(flag)
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return flags
    }
    
    func fetch3RandomFlag(bayrak_id: Int) -> [Flag] {
        var flags = [Flag]()
        
        db?.open()
        
        do {
            
            let rs = try db!.executeQuery("SELECT * FROM bayraklar WHERE bayrak_id != ? ORDER BY RANDOM() LIMIT 3", values: [bayrak_id])
            
            while rs.next() {
                let flag = Flag(bayrak_id: Int(rs.string(forColumn: "bayrak_id"))!,
                                bayrak_ad: rs.string(forColumn: "bayrak_ad")!,
                                bayrak_resim: rs.string(forColumn: "bayrak_resim")!)
                
                flags.append(flag)
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return flags
    }
}
