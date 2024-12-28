import Foundation

struct OnboardingPage: Identifiable {
    let id: UUID
    let title: String
    let description: String
}

let onboardingPages: [OnboardingPage] = [
    OnboardingPage(
        id: UUID(),
        title: "Welcome to SupplementMe",
        description: "Your personal supplement manager"
    ),
    OnboardingPage(
        id: UUID(),
        title: "Track Your Supplements",
        description: "Add your supplements and track your intake"
    ),
]
