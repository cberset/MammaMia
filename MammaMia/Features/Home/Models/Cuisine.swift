import Foundation

struct Cuisine: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let emoji: String
    
    static let allCuisines: [Cuisine] = [
        Cuisine(name: "Italian", emoji: "🍝"),
        Cuisine(name: "Vegan", emoji: "🥗"),
        Cuisine(name: "Seafood", emoji: "🦐"),
        Cuisine(name: "Japanese", emoji: "🍱"),
        Cuisine(name: "Indian", emoji: "🍛"),
        Cuisine(name: "Vegetarian", emoji: "🥬"),
        Cuisine(name: "Swiss", emoji: "🫕")
    ]
} 