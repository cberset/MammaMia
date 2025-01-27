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
            location: CLLocationCoordinate2D(latitude: 47.3769, longitude: 8.5417), // Zurich
            address: "Bahnhofstrasse 25, 8001 Zürich"
        ),
        Chef(
            name: "Yuki Tanaka",
            cuisines: [Cuisine.allCuisines[3]], // Japanese
            rating: 4.9,
            numberOfRatings: 89,
            location: CLLocationCoordinate2D(latitude: 47.3744, longitude: 8.5326), // Zurich
            address: "Löwenstrasse 15, 8001 Zürich"
        ),
        Chef(
            name: "Sarah Mueller",
            cuisines: [Cuisine.allCuisines[6]], // Swiss
            rating: 4.7,
            numberOfRatings: 156,
            location: CLLocationCoordinate2D(latitude: 47.3796, longitude: 8.5263), // Zurich
            address: "Langstrasse 45, 8004 Zürich"
        ),
        Chef(
            name: "Raj Patel",
            cuisines: [Cuisine.allCuisines[4]], // Indian
            rating: 4.9,
            numberOfRatings: 203,
            location: CLLocationCoordinate2D(latitude: 47.3827, longitude: 8.5452), // Zurich
            address: "Universitätstrasse 32, 8006 Zürich"
        ),
        Chef(
            name: "Emma Weber",
            cuisines: [Cuisine.allCuisines[1], Cuisine.allCuisines[5]], // Vegan & Vegetarian
            rating: 4.6,
            numberOfRatings: 78,
            location: CLLocationCoordinate2D(latitude: 47.3766, longitude: 8.5391), // Zurich
            address: "Rämistrasse 12, 8001 Zürich"
        )
    ]
} 