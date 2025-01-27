import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let dish: Dish
    let chefName: String
    var quantity: Int
    
    var total: Decimal {
        dish.price * Decimal(quantity)
    }
} 