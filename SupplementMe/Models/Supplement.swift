//
//  Supplement.swift
//  SupplementMe
//
//  Created by Kirill Pavlov on 11/14/24.
//

import Foundation


struct Supplement: Identifiable {
    let id: UUID
    let name: String
    let description: String
    let dosage: Int
    let takenToday: Bool
    let cycleCounter: Int?
    
    init(id: UUID = .init(), name: String, description: String, dosage: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.dosage = dosage
        self.takenToday = false
        self.cycleCounter = nil
    }
}


