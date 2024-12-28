import SwiftUI

struct OnboardingView: View {
    @Binding var hasCompletedOnboarding: Bool
    @State private var currentPage = 0

    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(Array(onboardingPages.enumerated()), id: \.element.id) { index, page in
                VStack(spacing: 20) {
                    Text(page.title)
                    Text(page.description)

                    if index == onboardingPages.count - 1 {
                        Button("Get Started") {
                            hasCompletedOnboarding = true
                        }
                    }
                }
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    OnboardingView(hasCompletedOnboarding: .constant(false))
}
