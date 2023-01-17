//
//  Grades.swift
//  GradesApp
//
//  Created by Yusuf Can Bircan on 17.01.2023.
//

import Foundation

class Grades {
    var id: Int?
    var name: String?
    var grade1: Double?
    var grade2: Double?
    
    init(id: Int, name: String, grade1: Double, grade2: Double) {
        self.id = id
        self.name = name
        self.grade1 = grade1
        self.grade2 = grade2
    }
    
    init() {
        
    }
}
