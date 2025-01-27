import Foundation

struct ChefProfile: Identifiable {
    let id = UUID()
    let name: String
    let bio: String
    let yearsOfExperience: Int
    let specialities: [Dish]
    let regularMenu: [Dish]
    let rating: Double
    
    static let marcoRossi = ChefProfile(
        name: "Marco Rossi",
        bio: "Born and raised in Milan, Chef Marco Rossi brings over 15 years of culinary expertise to the table. Specializing in traditional Northern Italian cuisine, he's known for his exceptional pasta dishes and innovative takes on classic recipes.",
        yearsOfExperience: 15,
        specialities: Dish.marcoSpecialities,
        regularMenu: Dish.marcoRegularMenu,
        rating: 4.8
    )
    
    static func from(_ chef: Chef) -> ChefProfile {
        // For now, return Marco's profile for Marco and a generic profile for others
        if chef.name == "Marco Rossi" {
            return .marcoRossi
        }
        
        // Generic profile for other chefs (you can add more specific profiles later)
        return ChefProfile(
            name: chef.name,
            bio: "A passionate chef specializing in \(chef.cuisines.map { $0.name }.joined(separator: " and ")) cuisine.",
            yearsOfExperience: Int.random(in: 5...20),
            specialities: [], // Add specific dishes later
            regularMenu: [], // Add specific dishes later
            rating: chef.rating
        )
    }
} 