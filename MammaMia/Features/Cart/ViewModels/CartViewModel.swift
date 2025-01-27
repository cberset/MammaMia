import Foundation

@MainActor
class CartViewModel: ObservableObject {
    @Published private(set) var items: [CartItem] = []
    
    var totalAmount: Decimal {
        items.reduce(Decimal.zero) { $0 + $1.total }
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    func addToCart(dish: Dish, chefName: String, quantity: Int) {
        if let index = items.firstIndex(where: { $0.dish.id == dish.id }) {
            // Update existing item
            items[index].quantity += quantity
        } else {
            // Add new item
            items.append(CartItem(dish: dish, chefName: chefName, quantity: quantity))
        }
    }
    
    func removeFromCart(itemId: UUID) {
        items.removeAll { $0.id == itemId }
    }
    
    func updateQuantity(for itemId: UUID, to newQuantity: Int) {
        guard let index = items.firstIndex(where: { $0.id == itemId }) else { return }
        items[index].quantity = newQuantity
    }
    
    func clearCart() {
        items.removeAll()
    }
} 