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
            Button(action: { showingAddSupplement = true }) {
                AddSupplement()
            }
        }
        .padding()
        .sheet(isPresented: $showingAddSupplement) {
            AddSupplementView(viewModel: viewModel)
        }
        TabView {
            Tab("Home", systemImage: "house") {
                // go home
            }

        }
    }
}

struct AddSupplement: View {
    var backgroundColor: Color = .blue  // Default background color

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
                    .foregroundColor(.white)  // Corrected here
            }
            .padding()
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct TimeOfDayView: View {
    @State private var timeOfDay: String = ""
    func determineTimeOfDay() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12:
            return "Morning"
        case 12..<17:
            return "Afternoon"
        case 17..<24:
            return "Evening"
        default:
            return "Unknown"
        }
    }

    var body: some View {
        VStack {
            Text("Good \(determineTimeOfDay())").font(.largeTitle).frame(
                maxWidth: .infinity, alignment: .leading
            ).padding()
        }
    }
}

#Preview {
    ContentView()
}
