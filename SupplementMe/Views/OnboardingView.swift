import AuthenticationServices
import SwiftUI

struct OnboardingView: View {
    @Binding var hasCompletedOnboarding: Bool
    @StateObject private var userManager = UserManager()
    @State private var currentPage = 0
    @State private var navigateToHome = false
    @State private var showError = false

    @State private var age: String = ""
    @State private var weight: String = ""
    @State private var height: String = ""

    private func validateInput() {
        switch currPage {
        case 0:
            if !age.isEmpty {
                currentPage += 1
            } else {
                showError = true
            }
        case 1:
            if !weight.isEmpty {
                currentPage += 1
            } else {
                showError = true
            }
        case 2:
            if height.isEmpty {
                showError = true
            }
        }
    }

    var body: some View {
        NavigationStack {
            TabView(selection: $currentPage) {
                ForEach(Array(onboardingPages.enumerated()), id: \.element.id) { index, page in
                    VStack {
                        if index == 0 {
                            Spacer()
                            Text(page.title).font(.largeTitle)
                            TextField("Enter your age", text: $age)
                                .textFieldStyle(WhiteBorder())
                                .padding(.horizontal, 40)

                            Spacer()
                            Button(action: {
                                currentPage += 1
                            }) {
                                ZStack {
                                    Circle()
                                        .fill(Color.black)
                                        .frame(width: 75, height: 75)

                                    Image(systemName: "arrow.right")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.horizontal, 40)
                            .padding(.bottom, 40)
                        }
                        if index == 1 {
                            Spacer()
                            Text(page.title).font(.largeTitle)
                            TextField("Enter your weight", text: $weight)
                                .textFieldStyle(WhiteBorder())
                                .padding(.horizontal, 40)

                            Spacer()

                            Button(action: {
                                currentPage += 1
                            }) {
                                ZStack {
                                    Circle()
                                        .fill(Color.black)
                                        .frame(width: 75, height: 75)

                                    Image(systemName: "arrow.right")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.horizontal, 40)
                            .padding(.bottom, 40)
                        }
                        if index == 2 {
                            VStack {
                                Spacer()

                                Text(page.title)
                                    .font(.largeTitle)
                                    .padding(.bottom)

                                TextField("Enter your height", text: $height)
                                    .textFieldStyle(WhiteBorder())
                                    .padding(.horizontal, 40)
                                    .frame(maxWidth: .infinity)

                                Spacer()

                                Button(action: saveUserAndComplete) {
                                    Text("Finish Onboarding")
                                        .foregroundColor(.white)
                                        .font(.body)
                                        .padding(.vertical, 12)
                                        .frame(maxWidth: .infinity)
                                        .background(Color.black)
                                        .cornerRadius(6)
                                }
                                .padding(.horizontal, 40)
                                .padding(.bottom, 40)
                            }
                        }
                    }
                }
            }
        }
        .navigationDestination(isPresented: $navigateToHome) {
            ContentView()
        }
    }

    private func saveUserAndComplete() {
        let user = User(
            age: Int(age) ?? nil,
            weight: Double(weight) ?? nil,
            height: Double(height) ?? nil,
            hasSignedInWithApple: userManager.currentUser?.hasSignedInWithApple ?? false
        )

        userManager.saveUser(user)
        hasCompletedOnboarding = true
        navigateToHome = true
    }
}

//struct SignInWithAppleButtonView: View {
//    @ObservedObject var userManager: UserManager
//
//    var body: some View {
//        SignInWithAppleButton(
//            .signIn,
//            onRequest: { request in
//                request.requestedScopes = [.fullName, .email]
//            },
//            onCompletion: { result in
//                switch result {
//                case .success(let authResults):
//                    if let appleIDCredential = authResults.credential
//                        as? ASAuthorizationAppleIDCredential
//                    {
//                        let user = User(
//                            name: appleIDCredential.fullName?.givenName,
//                            email: appleIDCredential.email,
//                            hasSignedInWithApple: true
//                        )
//                        userManager.saveUser(user)
//                    }
//                case .failure(let error):
//                    print("Auth error: \(error)")
//                }
//            }
//        )
//        .signInWithAppleButtonStyle(.black)
//    }
//}
struct ContinueWithoutSignUpView: View {
    var body: some View {
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
}

struct WhiteBorder: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(12)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(.black, lineWidth: 1)
            )
    }
}

#Preview {
    OnboardingView(hasCompletedOnboarding: .constant(false))
}
