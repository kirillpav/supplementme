//
//  SupplementViewModel.swift
//  SupplementMe
//
//  Created by Kirill Pavlov on 11/14/24.
//

import Foundation

class SupplementViewModel: ObservableObject{
    @Published private(set) var supplements: [Supplement] = []
    
    func addSupplement( supplement: Supplement) {
        supplements.append(supplement)
    }
    
    func removeSupplement( supplement: Supplement) {
        supplements.removeAll(where: { $0.id == supplement.id })
    }
    
    func updateDosage(supplementName: String, dosage: Int){
        // implement later
    }
    
    
}
