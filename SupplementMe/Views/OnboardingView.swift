import AuthenticationServices
import SwiftUI

struct OnboardingView: View {
    @Binding var hasCompletedOnboarding: Bool
    @State private var currentPage = 0

    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(Array(onboardingPages.enumerated()), id: \.element.id) { index, page in
                VStack {
                    Text(page.title).font(.largeTitle)
                    Text(page.description)

                    if index == 0 {
                        SignInWithAppleButtonView()
                            .frame(height: 50)
                            .padding(.horizontal, 40)
                    }

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

struct SignInWithAppleButtonView: View {
    var body: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case .success(let authResults):
                    print("Auth success")
                case .failure(let error):
                    print("Auth error: \(error)")
                }
            }
        )
        .signInWithAppleButtonStyle(.black)
    }
}

#Preview {
    OnboardingView(hasCompletedOnboarding: .constant(false))
}
