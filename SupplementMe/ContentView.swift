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
            TimeOfDayView()
            Spacer()
            Button(action: { showingAddSupplement = true }) {
                AddSupplement()
            }
        }
        .padding()
        .sheet(isPresented: $showingAddSupplement) {
            AddSupplementView(viewModel: viewModel)
        }
    }
}

struct AddSupplement: View {
    var backgroundColor: Color = .black  // Default background color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100)
                .fill(backgroundColor)
                .frame(height: 75)
                .frame(width: 75)

            HStack(spacing: 12) {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.horizontal)
        .padding(.bottom)
    }
}

// time of day view
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
            Text("Good \(determineTimeOfDay()) 'name'").font(.largeTitle).frame(
                maxWidth: .infinity, alignment: .leading
            ).padding()
        }
    }
}

#Preview {
    ContentView()
}
