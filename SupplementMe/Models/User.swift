import Foundation

struct User: Codable, Identifiable {
    var id: UUID
    var name: String?
    var email: String?
    var age: Int?
    var weight: Double?
    var height: Double?

    var hasSignedInWithApple: Bool
    var createdAt: Date

    init(
        id: UUID = UUID(),
        name: String? = nil,
        email: String? = nil,
        age: Int? = nil,
        weight: Double? = nil,
        height: Double? = nil,
        hasSignedInWithApple: Bool = false
    ) {
        self.id = id
        self.name = name
        self.email = email
        self.age = age
        self.weight = weight
        self.height = height
        self.hasSignedInWithApple = hasSignedInWithApple
        self.createdAt = Date()
    }
}
