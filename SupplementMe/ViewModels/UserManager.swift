import Foundation
import SwiftUI

class UserManager: ObservableObject {
    @Published var currentUser: User?
    private let userDefaultsKey = "savedUser"

    init() {
        loadUser()
    }

    func saveUser(_ user: User) {
        currentUser = user

        if let ecoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(ecoded, forKey: userDefaultsKey)
        }
    }

    private func loadUser() {
        if let savedUser = UserDefaults.standard.data(forKey: userDefaultsKey),
            let decodedUser = try? JSONDecoder().decode(User.self, from: savedUser)
        {
            currentUser = decodedUser
        }
    }

    func signOut() {
        currentUser = nil
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
    }
}
