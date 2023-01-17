//
//  GradesDao.swift
//  GradesApp
//
//  Created by Yusuf Can Bircan on 17.01.2023.
//

import Foundation

class GradesDao {
    var db:FMDatabase?
    
    init() {
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let databaseURL = URL(fileURLWithPath: destinationPath).appending(path: "Grades.sqlite")
        
        db = FMDatabase(path: databaseURL.path())
    }
    
    func fetchAllData() -> [Grades] {
        var grades = [Grades]()
        
        db?.open()
        
        do {
            
            let rs = try db!.executeQuery("SELECT * FROM grades", values: nil)
            
            while rs.next() {
                
                let grade = Grades(id: Int(rs.string(forColumn: "id"))!,
                                   name: rs.string(forColumn: "name")!,
                                   grade1: Double(rs.string(forColumn: "grade1"))!,
                                   grade2: Double(rs.string(forColumn: "grade2"))!)
                
                grades.append(grade)
                
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return grades
    }
    
    func addGrade(name:String, grade1: Double, grade2:Double) {
        
        db?.open()
        
        do {
            
            try db!.executeUpdate("INSERT INTO grades(name, grade1, grade2) VALUES(?,?,?)", values: [name, grade1, grade2])
            
        } catch {
            print(error.localizedDescription)
        }
         
        db?.close()
    }
    
    func deleteData(id: Int) {
        
        db?.open()
        
        do {
            
            try db!.executeUpdate("DELETE FROM grades WHERE id = ?", values: [id])
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func updateData(id: Int, name: String, grade1: Double, grade2: Double) {
        
        db?.open()
        
        do {
            
            try db!.executeUpdate("UPDATE grades SET name = ?, grade1 = ?, grade2 = ? WHERE id = ?", values: [name, grade1, grade2, id])
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
}
