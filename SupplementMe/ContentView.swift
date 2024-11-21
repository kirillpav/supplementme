//
//  ContentView.swift
//  SupplementMe
//
//  Created by Kirill Pavlov on 11/14/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SupplementViewModel()
    @State private var showingAddSupplement: Bool = false
    
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.supplements) {
                    supplement in Text(supplement.name)
                }
            }
            Button(action: {showingAddSupplement = true}) {
                AddSupplement()
            }
        }
        .padding()
        .sheet(isPresented: $showingAddSupplement) {
            AddSupplementView(viewModel: viewModel)
        }
        TabView{
            Tab("Home", systemImage: "house"){
                // go home
            }
            
        }
    }
}

struct AddSupplement: View {
    var backgroundColor: Color = .blue // Default background color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(backgroundColor)
            
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(backgroundColor)
            
            VStack(spacing: 8) {
                Image(systemName: "plus.circle")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text("Add Semester")
                    .font(.headline)
                    .foregroundColor(.white) // Corrected here
            }
            .padding()
        }
        .aspectRatio(1, contentMode: .fit)
    }
}


#Preview {
    ContentView()
}
