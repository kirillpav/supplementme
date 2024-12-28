//
//  SupplementMeApp.swift
//  SupplementMe
//
//  Created by Kirill Pavlov on 11/14/24.
//

import SwiftUI

@main
struct SupplementMeApp: App {
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false

    var body: some Scene {
        WindowGroup {
            if hasCompletedOnboarding {
                ContentView()
            } else {
                OnboardingView(hasCompletedOnboarding: $hasCompletedOnboarding)
            }
        }
    }
}
