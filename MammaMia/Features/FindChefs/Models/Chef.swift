import Foundation
import CoreLocation

struct Chef: Identifiable {
    let id = UUID()
    let name: String
    let cuisines: [Cuisine]
    let rating: Double
    let numberOfRatings: Int
    let location: CLLocationCoordinate2D
    let address: String
    
    static let sampleChefs = [
        Chef(
            name: "Marco Rossi",
            cuisines: [Cuisine.allCuisines[0]], // Italian
            rating: 4.8,
            numberOfRatings: 124,
            location: CLLocationCoordinate2D(latitude: 47.3785, longitude: 8.5163), // ~150m from user
            address: "Hohlstrasse 42, 8004 Zürich"
        ),
        Chef(
            name: "Yuki Tanaka",
            cuisines: [Cuisine.allCuisines[3]], // Japanese
            rating: 4.9,
            numberOfRatings: 89,
            location: CLLocationCoordinate2D(latitude: 47.3755, longitude: 8.5143), // ~250m from user
            address: "Seebahnstrasse 89, 8003 Zürich"
        ),
        Chef(
            name: "Sarah Mueller",
            cuisines: [Cuisine.allCuisines[6]], // Swiss
            rating: 4.7,
            numberOfRatings: 156,
            location: CLLocationCoordinate2D(latitude: 47.3795, longitude: 8.5173), // ~300m from user
            address: "Langstrasse 92, 8004 Zürich"
        ),
        Chef(
            name: "Raj Patel",
            cuisines: [Cuisine.allCuisines[4]], // Indian
            rating: 4.9,
            numberOfRatings: 203,
            location: CLLocationCoordinate2D(latitude: 47.3745, longitude: 8.5133), // ~400m from user
            address: "Ankerstrasse 24, 8004 Zürich"
        ),
        Chef(
            name: "Emma Weber",
            cuisines: [Cuisine.allCuisines[1], Cuisine.allCuisines[5]], // Vegan & Vegetarian
            rating: 4.6,
            numberOfRatings: 78,
            location: CLLocationCoordinate2D(latitude: 47.3805, longitude: 8.5183), // ~500m from user
            address: "Militärstrasse 15, 8004 Zürich"
        )
    ]
} 