//
//  SupplementMeApp.swift
//  SupplementMe
//
//  Created by Kirill Pavlov on 11/14/24.
//

import SwiftUI

@main
struct SupplementMeApp: App {
    @StateObject private var userManager = UserManager()
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false

    init() {
        UserDefaults.standard.set(false, forKey: "hasCompletedOnboarding")
    }

    var body: some Scene {
        WindowGroup {
            Group {
                if hasCompletedOnboarding {
                    ContentView()
                        .environmentObject(userManager)
                } else {
                    WelcomeView()
                        .environmentObject(userManager)
                }
            }
        }
    }
}
