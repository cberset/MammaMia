import Foundation
import MapKit
import CoreLocation

@MainActor
class FindChefsViewModel: ObservableObject {
    @Published private(set) var chefs: [Chef]
    @Published var isShowingMap = false
    @Published var searchText = ""
    @Published var selectedCuisine: Cuisine?
    @Published var region: MKCoordinateRegion
    @Published var userLocation: CLLocation?
    
    private let locationManager = CLLocationManager()
    
    init() {
        // Initialize properties
        self.chefs = Chef.sampleChefs
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 47.3775, longitude: 8.5153), // Erismannstrasse 36
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
        
        // Setup location services
        setupLocationManager()
    }
    
    private func setupLocationManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        
        // For demo purposes, set a default location at Erismannstrasse 36
        userLocation = CLLocation(latitude: 47.3775, longitude: 8.5153)
    }
    
    var filteredChefs: [Chef] {
        var filtered = chefs
        
        // Filter by cuisine if selected
        if let cuisine = selectedCuisine {
            filtered = filtered.filter { chef in
                chef.cuisines.contains { $0.name == cuisine.name }
            }
        }
        
        // Filter by search text
        if !searchText.isEmpty {
            filtered = filtered.filter { chef in
                chef.name.localizedCaseInsensitiveContains(searchText) ||
                chef.cuisines.contains { cuisine in
                    cuisine.name.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
        
        return filtered
    }
    
    func selectCuisine(_ cuisine: Cuisine?) {
        selectedCuisine = cuisine
        searchText = cuisine?.name ?? ""
    }
    
    func clearSelection() {
        selectedCuisine = nil
        searchText = ""
    }
    
    func distanceString(to chefLocation: CLLocationCoordinate2D) -> String {
        guard let userLocation = userLocation else { return "Distance unknown" }
        
        let chefCLLocation = CLLocation(latitude: chefLocation.latitude, longitude: chefLocation.longitude)
        let distanceInMeters = userLocation.distance(from: chefCLLocation)
        
        if distanceInMeters < 1000 {
            return "\(Int(distanceInMeters))m away"
        } else {
            let distanceInKm = distanceInMeters / 1000
            return String(format: "%.1fkm away", distanceInKm)
        }
    }
} 