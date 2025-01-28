import Foundation

enum Tab: String, CaseIterable {
    case home = "home"
    case findChefs = "findChefs"
    case cart = "cart"
    case orders = "orders"
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .findChefs: return "Find Chefs"
        case .cart: return "Cart"
        case .orders: return "Orders"
        }
    }
    
    var systemImage: String {
        switch self {
        case .home: return "house"
        case .findChefs: return "magnifyingglass"
        case .cart: return "cart"
        case .orders: return "bag"
        }
    }
} 