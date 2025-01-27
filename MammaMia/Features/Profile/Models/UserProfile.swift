import Foundation

struct UserProfile {
    let name: String
    let email: String
    let phoneNumber: String
    let address: String
    var paymentMethods: [PaymentMethod]
    
    static let sample = UserProfile(
        name: "John Doe",
        email: "john.doe@example.com",
        phoneNumber: "+41 76 123 45 67",
        address: "Bahnhofstrasse 1, 8001 Zürich",
        paymentMethods: PaymentMethod.sampleMethods
    )
} 