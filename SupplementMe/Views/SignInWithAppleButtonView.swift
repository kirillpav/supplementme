//
//  SignInWithAppleButtonView.swift
//  SupplementMe
//
//  Created by Kirill Pavlov on 12/30/24.
//

import SwiftUI
import _AuthenticationServices_SwiftUI

struct SignInWithAppleButtonView: View {
    @ObservedObject var userManager: UserManager

    var body: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case .success(let authResults):
                    if let appleIDCredential = authResults.credential
                        as? ASAuthorizationAppleIDCredential
                    {
                        let user = User(
                            name: appleIDCredential.fullName?.givenName,
                            email: appleIDCredential.email,
                            hasSignedInWithApple: true
                        )
                        userManager.saveUser(user)
                    }
                case .failure(let error):
                    print("Auth error: \(error)")
                }
            }
        )
        .signInWithAppleButtonStyle(.black)
    }
}

