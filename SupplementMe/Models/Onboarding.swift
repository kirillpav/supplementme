import Foundation

struct OnboardingPage: Identifiable {
    let id: UUID
    let title: String
    let description: String
}

let onboardingPages: [OnboardingPage] = [
    OnboardingPage(
        id: UUID(),
        title: "Your Age",
        description: ""
    ),
    OnboardingPage(
        id: UUID(),
        title: "Your Weight",
        description: ""
    ),
    OnboardingPage(
        id: UUID(),
        title: "Your Height",
        description: ""
    ),
]
