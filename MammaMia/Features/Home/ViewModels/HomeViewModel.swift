import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var selectedCuisines: Set<Cuisine> = []
    @Published var searchText: String = ""
    let availableCuisines = Cuisine.allCuisines
    
    var filteredCuisines: [Cuisine] {
        if searchText.isEmpty {
            return availableCuisines
        }
        return availableCuisines.filter { cuisine in
            cuisine.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    func toggleCuisine(_ cuisine: Cuisine) {
        if selectedCuisines.contains(cuisine) {
            selectedCuisines.remove(cuisine)
        } else {
            selectedCuisines.insert(cuisine)
        }
    }
    
    func isSelected(_ cuisine: Cuisine) -> Bool {
        selectedCuisines.contains(cuisine)
    }
} 