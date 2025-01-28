import Foundation
import SwiftUI

@MainActor
class CartViewModel: ObservableObject {
    @Published private(set) var items: [CartItem] = []
    @Published var showingAddedToCart = false
    @Published var lastAddedItem: String?
    @Published var orderConfirmed = false
    @Published private(set) var activeOrder: Order?
    
    var totalAmount: Decimal {
        items.reduce(Decimal.zero) { $0 + $1.total }
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    var itemCount: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
    
    func addToCart(dish: Dish, chefName: String, quantity: Int) {
        if let index = items.firstIndex(where: { $0.dish.id == dish.id }) {
            // Update existing item
            items[index].quantity += quantity
        } else {
            // Add new item
            items.append(CartItem(dish: dish, chefName: chefName, quantity: quantity))
        }
        
        // Show notification
        lastAddedItem = dish.name
        showingAddedToCart = true
        
        // Hide notification after 3 seconds
        Task {
            try? await Task.sleep(nanoseconds: 3_000_000_000)
            showingAddedToCart = false
            lastAddedItem = nil
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
        orderConfirmed = false
    }
    
    func confirmOrder() {
        orderConfirmed = true
        activeOrder = Order.createFromCart(items, totalAmount: totalAmount)
    }
} 