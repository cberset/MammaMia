import Foundation

struct PaymentMethod: Identifiable {
    let id = UUID()
    let type: PaymentType
    let lastFourDigits: String
    let expiryDate: String
    let isDefault: Bool
    
    enum PaymentType {
        case visa
        case mastercard
        case twint
        
        var name: String {
            switch self {
            case .visa: return "Visa"
            case .mastercard: return "Mastercard"
            case .twint: return "TWINT"
            }
        }
        
        var systemImage: String {
            switch self {
            case .visa, .mastercard: return "creditcard"
            case .twint: return "iphone"
            }
        }
    }
    
    static let sampleMethods = [
        PaymentMethod(type: .visa, lastFourDigits: "4242", expiryDate: "12/24", isDefault: true),
        PaymentMethod(type: .mastercard, lastFourDigits: "8888", expiryDate: "06/25", isDefault: false),
        PaymentMethod(type: .twint, lastFourDigits: "0000", expiryDate: "", isDefault: false)
    ]
} 