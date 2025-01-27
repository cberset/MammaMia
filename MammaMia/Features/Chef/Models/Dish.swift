import Foundation

struct Dish: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let price: Decimal
    let preparationTime: Int // in minutes
    let isSpeciality: Bool
    let allergens: [String]
    
    static let marcoSpecialities = [
        Dish(
            name: "Homemade Lasagna",
            description: "Traditional lasagna with homemade pasta, rich meat ragù, and creamy béchamel sauce",
            price: 24.90,
            preparationTime: 35,
            isSpeciality: true,
            allergens: ["Gluten", "Dairy", "Eggs"]
        ),
        Dish(
            name: "Osso Buco",
            description: "Braised veal shanks in white wine sauce with gremolata",
            price: 32.50,
            preparationTime: 45,
            isSpeciality: true,
            allergens: ["Celery"]
        )
    ]
    
    static let marcoRegularMenu = [
        Dish(
            name: "Spaghetti Carbonara",
            description: "Classic Roman pasta with eggs, pecorino cheese, guanciale, and black pepper",
            price: 19.90,
            preparationTime: 20,
            isSpeciality: false,
            allergens: ["Gluten", "Dairy", "Eggs"]
        ),
        Dish(
            name: "Risotto ai Funghi",
            description: "Creamy mushroom risotto with porcini and fresh herbs",
            price: 22.50,
            preparationTime: 25,
            isSpeciality: false,
            allergens: ["Dairy"]
        ),
        Dish(
            name: "Vitello Tonnato",
            description: "Thinly sliced veal with creamy tuna-flavored sauce",
            price: 26.90,
            preparationTime: 15,
            isSpeciality: false,
            allergens: ["Eggs", "Fish"]
        )
    ]
} 