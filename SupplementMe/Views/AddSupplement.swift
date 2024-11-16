//
//  AddSupplement.swift
//  SupplementMe
//
//  Created by Kirill Pavlov on 11/14/24.
//

import SwiftUI

struct AddSupplement: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewMode: SupplementViewModel
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var dosage: Double = 0
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Supplement Information")) {
                    TextField("Supplement Name", text: $name)
                    TextField("Description", text: $description)
                    TextField("Dosage", value: $dosage, format: .number)
                        .keyboardType(.numberPad)
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Add Supplement") {
                        saveSupplement()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
    
    private func saveSupplement(){
        let newSupplement = Supplement(name: name, description: description, dosage: Int(dosage))
        viewMode.addSupplement(supplement: newSupplement)
        dismiss()
    }
}



//#Preview {
//    AddSupplement()
//}
