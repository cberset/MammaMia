import Foundation

@MainActor
class AppViewModel: ObservableObject {
    @Published var selectedTab: Tab = .home
    @Published var selectedCuisine: Cuisine?
    
    func showChefs(forCuisine cuisine: Cuisine) {
        selectedCuisine = cuisine
        selectedTab = .findChefs
    }
} 