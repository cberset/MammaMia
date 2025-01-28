import Foundation

struct Order: Identifiable {
    let id = UUID()
    let items: [CartItem]
    let totalAmount: Decimal
    let orderDate: Date
    let estimatedReadyTime: Date
    let chefAddress: String
    let chefName: String
    
    static func createFromCart(_ items: [CartItem], totalAmount: Decimal) -> Order {
        let orderDate = Date()
        let estimatedReadyTime = Calendar.current.date(byAdding: .minute, value: 20, to: orderDate)!
        
        // Group items by chef to get chef details
        let firstItem = items.first!
        return Order(
            items: items,
            totalAmount: totalAmount,
            orderDate: orderDate,
            estimatedReadyTime: estimatedReadyTime,
            chefAddress: "Hohlstrasse 42, 8004 Zürich", // For demo, we'll use Marco's address
            chefName: firstItem.chefName
        )
    }
} 