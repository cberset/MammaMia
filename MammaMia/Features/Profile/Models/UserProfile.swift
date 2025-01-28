import Foundation

struct UserProfile {
    let name: String
    let email: String
    let phoneNumber: String
    let address: String
    var paymentMethods: [PaymentMethod]
    
    static let sample = UserProfile(
        name: "Signora Isufi",
        email: "ei@example.com",
        phoneNumber: "+41 76 123 45 67",
        address: "Erismannstrasse 36, 8004 Zurich",
        paymentMethods: PaymentMethod.sampleMethods
    )
} 