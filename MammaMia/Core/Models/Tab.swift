import Foundation

enum Tab: String, CaseIterable {
    case home = "Home"
    case findChefs = "Find Chefs"
    case cart = "Cart"
    
    var title: String {
        rawValue
    }
    
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .findChefs:
            return "magnifyingglass"
        case .cart:
            return "cart"
        }
    }
} 