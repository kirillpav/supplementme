import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var userManager: UserManager
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @State private var startOnboarding = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()

                Text("DOSE")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Your personal supplement manager")
                    .font(.body)
                    .foregroundColor(.gray)

                Spacer()

                VStack(spacing: 16) {
                    SignInWithAppleButtonView(userManager: userManager)
                        .frame(height: 50)
                        .padding(.horizontal, 40)
                    Button(action: {
                        startOnboarding = true
                    }) {
                        Text("Continue without sign up")
                            .foregroundColor(.gray)
                            .font(.body)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.black, lineWidth: 1)
                            )
                    }
                    .padding(.horizontal, 40)
                }
                .padding(.bottom, 40)
            }
            .navigationDestination(isPresented: $startOnboarding) {
                OnboardingView(hasCompletedOnboarding: $hasCompletedOnboarding)
            }
        }
    }
}

#Preview {
    WelcomeView()
        .environmentObject(UserManager())
}
